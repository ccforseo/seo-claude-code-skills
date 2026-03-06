#!/usr/bin/env bash
set -euo pipefail

# SEO Skills for Claude Code - Installer
# https://github.com/ccforseo/seo-claude-code-skills

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

SKILLS=(
  seo-audit
  schema-gen
  keyword-cluster
  content-brief
  internal-links
  ai-visibility
  meta-optimizer
  cannibalization
)

REPO_URL="https://github.com/ccforseo/seo-claude-code-skills.git"

# ── Helpers ───────────────────────────────────────────────────────────
info()    { echo -e "${BOLD}$1${RESET}"; }
success() { echo -e "${GREEN}$1${RESET}"; }
warn()    { echo -e "${YELLOW}$1${RESET}"; }
error()   { echo -e "${RED}$1${RESET}"; exit 1; }

# ── Target platform ───────────────────────────────────────────────────
# Usage: install.sh [--target claude|codex|antigravity|all]
get_platform_dir() {
  case "$1" in
    claude)       echo "$HOME/.claude/skills" ;;
    codex)        echo "$HOME/.codex/skills" ;;
    antigravity)  echo "$HOME/.agent/skills" ;;
    *)            error "Unknown target: $1. Use claude, codex, antigravity, or all." ;;
  esac
}

TARGET="${1:-}"
case "$TARGET" in
  --target)  TARGET="${2:-claude}" ;;
  "")        TARGET="claude" ;;
esac

if [[ "$TARGET" == "all" ]]; then
  INSTALL_TARGETS=("claude" "codex" "antigravity")
else
  get_platform_dir "$TARGET" > /dev/null
  INSTALL_TARGETS=("$TARGET")
fi

# ── Detect OS ──────────────────────────────────────────────────────────
detect_os() {
  case "$(uname -s)" in
    Darwin)  OS="macOS" ;;
    Linux)
      if grep -qi microsoft /proc/version 2>/dev/null; then
        OS="WSL"
      else
        OS="Linux"
      fi
      ;;
    *) error "Unsupported OS: $(uname -s)" ;;
  esac
  info "Detected OS: $OS"
}

# ── Resolve source directory ───────────────────────────────────────────
resolve_source() {
  # If we're inside the cloned repo already, use it
  if [[ -f "./install.sh" && -d "./seo-audit" ]]; then
    SOURCE_DIR="$(pwd)"
    CLEANUP=false
    info "Installing from local clone..."
    return
  fi

  # Otherwise, clone to a temp directory
  TMPDIR_PATH="$(mktemp -d)"
  info "Cloning seo-skills repo..."
  git clone --depth 1 "$REPO_URL" "$TMPDIR_PATH/seo-skills" 2>/dev/null \
    || error "Failed to clone repo. Check your internet connection."
  SOURCE_DIR="$TMPDIR_PATH/seo-skills"
  CLEANUP=true
}

# ── Install skills ─────────────────────────────────────────────────────
install_skills() {
  for target in "${INSTALL_TARGETS[@]}"; do
    local target_dir
    target_dir="$(get_platform_dir "$target")"
    mkdir -p "$target_dir"

    local installed=0
    for skill in "${SKILLS[@]}"; do
      if [[ ! -d "$SOURCE_DIR/$skill" ]]; then
        warn "  Skipping $skill (not found in source)"
        continue
      fi
      cp -r "$SOURCE_DIR/$skill" "$target_dir/$skill"
      installed=$((installed + 1))
    done

    if [[ $installed -eq 0 ]]; then
      error "No skills were installed. Something went wrong."
    fi

    success "  Installed $installed skills to $target_dir ($target)"
  done
  echo ""
}

# ── Cleanup temp files ─────────────────────────────────────────────────
cleanup() {
  if [[ "${CLEANUP:-false}" == "true" && -n "${TMPDIR_PATH:-}" ]]; then
    rm -rf "$TMPDIR_PATH"
  fi
}
trap cleanup EXIT

# ── Print results ──────────────────────────────────────────────────────
print_summary() {
  echo ""
  echo -e "${BOLD}Available skills:${RESET}"
  echo ""
  echo -e "  ${GREEN}/seo-audit${RESET}          Run a technical SEO audit"
  echo -e "  ${GREEN}/schema-gen${RESET}          Generate JSON-LD schema markup"
  echo -e "  ${GREEN}/keyword-cluster${RESET}     Cluster keywords by intent"
  echo -e "  ${GREEN}/content-brief${RESET}       Generate an SEO content brief"
  echo -e "  ${GREEN}/internal-links${RESET}      Find internal linking opportunities"
  echo -e "  ${GREEN}/ai-visibility${RESET}       Check brand mentions in AI responses"
  echo -e "  ${GREEN}/meta-optimizer${RESET}      Rewrite titles and descriptions"
  echo -e "  ${GREEN}/cannibalization${RESET}     Detect keyword cannibalization"
  echo ""
  echo -e "${DIM}Open Claude Code and type any command above to start.${RESET}"
  echo ""
  echo -e "${BOLD}Want live GSC, GA4, and Ads data inside Claude Code?${RESET}"
  echo -e "  ${DIM}ccforseo.com/claude-code-for-seo${RESET}"
  echo ""
}

# ── Main ───────────────────────────────────────────────────────────────
main() {
  echo ""
  echo -e "${BOLD}  SEO Skills for Claude Code${RESET}"
  echo -e "${DIM}  ccforseo.com${RESET}"
  echo ""

  detect_os
  resolve_source
  install_skills
  print_summary
}

main
