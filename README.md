<p align="center">
  <code>$ /seo-audit https://yoursite.com</code>
</p>

<h1 align="center">SEO Skills for Claude Code</h1>

<p align="center">
  8 free skills that turn Claude Code into an SEO command line.<br>
  Type a slash command. Get results. No plugins, no API keys.
</p>

<p align="center">
  <a href="#quick-install"><img src="https://img.shields.io/badge/install-30_seconds-brightgreen.svg" alt="30 second install"></a>
  <img src="https://img.shields.io/badge/skills-8-blue.svg" alt="8 skills">
  <img src="https://img.shields.io/badge/platforms-Claude_Code_%7C_Codex_%7C_Antigravity-orange.svg" alt="Multi-platform">
  <a href="https://github.com/ccforseo/seo-claude-code-skills/stargazers"><img src="https://img.shields.io/github/stars/ccforseo/seo-claude-code-skills?style=social" alt="GitHub stars"></a>
</p>

---

## What Are Claude Code SEO Skills?

Claude Code skills are reusable prompt files (SKILL.md) that live in your `~/.claude/skills/` folder. When you type a slash command like `/seo-audit`, Claude Code reads the skill file and follows its instructions.

Each skill here handles one SEO task: auditing sites, clustering keywords, generating schema markup, optimizing meta tags, tracking AI visibility, and more.

No code to write. No APIs to configure. Install the skills, open Claude Code, type a command.

---

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/ccforseo/seo-claude-code-skills/main/install.sh | bash
```

Skills install to `~/.claude/skills/`. Open Claude Code and start typing.

**Works with OpenAI Codex and Antigravity too:**

```bash
# Install for all supported platforms at once
curl -fsSL https://raw.githubusercontent.com/ccforseo/seo-claude-code-skills/main/install.sh | bash -s -- --target all
```

> **Want to analyze your own GSC, GA4, and Ads data?** The [SEO Command Center](https://ccforseo.com/claude-code-for-seo) adds data pipelines, report templates, and CLAUDE.md configs on top of these free skills. [Learn more](https://ccforseo.com/claude-code-for-seo)

---

## All 8 Skills

| Skill | Command | What It Does |
|-------|---------|--------------|
| [SEO Audit](#seo-audit) | `/seo-audit` | Full technical audit with A-F scoring across 10 categories |
| [Schema Generator](#schema-generator) | `/schema-gen` | JSON-LD structured data for any page type |
| [Keyword Cluster](#keyword-cluster) | `/keyword-cluster` | Group keywords by search intent and topic |
| [Content Brief](#content-brief) | `/content-brief` | Writer-ready brief with SERP analysis and AEO citation blocks |
| [Internal Links](#internal-links) | `/internal-links` | Find orphan pages, link gaps, and anchor text issues |
| [AI Visibility](#ai-visibility) | `/ai-visibility` | Check if AI search engines cite your brand |
| [Meta Optimizer](#meta-optimizer) | `/meta-optimizer` | Rewrite titles and descriptions for higher CTR |
| [Cannibalization](#cannibalization) | `/cannibalization` | Find pages competing for the same keywords |

---

## SEO Audit

Run a complete technical SEO audit on any URL. Covers 10 categories with 80+ checks.

```
/seo-audit https://yoursite.com
```

**What it checks:**
- Crawlability and indexation (robots.txt, sitemaps, canonicals)
- HTTPS and security headers
- Core Web Vitals (LCP, INP, CLS)
- Mobile usability
- On-page SEO (titles, headings, images)
- Structured data validation
- Internal linking depth
- E-E-A-T signals
- AI search readiness (bot access, content extractability)

**Output:** Scored report (A-F per category) with prioritized fixes, effort estimates, and references to other skills for resolution.

---

## Schema Generator

Generate valid JSON-LD structured data for any page type. Copy the output, paste it into your site, and pass Google's Rich Results Test.

```
/schema-gen Article https://yoursite.com/blog/post-title
```

**Supported types:** Article, Product + Offer, FAQPage, HowTo, LocalBusiness, Organization + WebSite, Person, BreadcrumbList, Event, Course, SoftwareApplication, VideoObject, Review + AggregateRating.

**Output:** Ready-to-paste JSON-LD blocks with all required and recommended properties. Includes validation checklist.

---

## Keyword Cluster

Feed in a raw keyword list. Get back clusters grouped by topic and search intent, scored by priority, and mapped to pages on your site.

```
/keyword-cluster keywords.csv
```

**Accepts:** CSV files, JSON, or pasted keyword lists (one per line).

**What it does:**
1. Classifies every keyword by intent (informational, navigational, commercial, transactional)
2. Groups keywords into topic clusters using SERP overlap and semantic similarity
3. Detects cannibalization risk across clusters
4. Maps clusters to existing pages or flags new page opportunities
5. Scores each cluster 0-100 by volume, intent value, and competition

**Output:** Cluster report with summary table, quick wins, cannibalization alerts, and a content calendar.

---

## Content Brief

Generate a writer-ready content brief from a target keyword. Covers everything needed to outrank current results and get cited by AI search engines.

```
/content-brief "claude code seo tutorial"
```

**What it produces:**
- SERP analysis of top 10 results (content type, word count, heading patterns)
- Primary + 8-15 secondary keywords with placement plan
- Search intent analysis
- Full article skeleton (H1/H2/H3) with section guidance
- AEO citation blocks (50-70 word paragraphs optimized for AI extraction)
- Entity list with first-mention definitions
- Competitor analysis with differentiation angles
- Internal linking plan
- Ready-to-use title tag, meta description, URL slug, and schema recommendations

---

## Internal Links

Analyze your site's internal linking structure. Find orphan pages, broken links, anchor text problems, and missing connections between related content.

```
/internal-links sitemap.xml
```

**Accepts:** Crawl exports (Screaming Frog, Sitebulb), sitemap URLs, or URL lists.

**What it finds:**
- Orphan pages with zero internal links
- Link equity sinks and deserts
- Generic anchor text ("click here", "read more")
- Hub-spoke gaps (pillar pages not connected to their articles)
- Pages buried 4+ clicks deep
- Broken internal links and redirect chains

**Output:** Executive summary, critical issues, top 10 link insertions with suggested anchor text and context sentences.

---

## AI Visibility

Check whether ChatGPT, Perplexity, Google AI Overviews, Claude, Copilot, and Gemini cite your brand when people search for topics you cover.

```
/ai-visibility --brand "yoursite" --domain yoursite.com
```

**What it audits:**
- **Bot access:** Are AI crawlers blocked in your robots.txt?
- **Citation presence:** Does your domain show up in AI answers for your target queries?
- **Content extractability:** Is your content structured for AI extraction? (definition blocks, tables, FAQs, cited stats)
- **Competitor citations:** Who gets cited instead, and what do they do differently?

**Output:** AI Visibility Score (% of queries citing you), per-platform breakdown, extractability scores, and a three-pillar fix plan.

---

## Meta Optimizer

Rewrite title tags and meta descriptions to improve click-through rates. Checks character limits, analyzes competitor titles, and generates SERP previews.

```
/meta-optimizer --url https://yoursite.com/pricing
```

**What it does:**
- Checks titles and descriptions against character limits
- Analyzes competitor titles in top 10 for gaps
- Generates SERP preview mockups
- Flags duplicates, keyword stuffing, brand-first titles, and intent mismatches
- Suggests A/B test variants for high-traffic pages

**Works on:** Single URLs, URL lists, or full sitemaps for batch processing.

---

## Cannibalization

Find pages on your site that compete against each other for the same keywords. Cannibalization splits ranking signals and suppresses both pages.

```
/cannibalization --sitemap https://yoursite.com/sitemap.xml --query "seo audit"
```

**Detection methods:** GSC query overlap, site search, SERP position checks, title and content overlap.

**For each issue:** Severity score, competing URLs with traffic data, and a recommended action (consolidate, differentiate, canonicalize, or noindex) with step-by-step instructions.

---

## How Skills Work Together

These skills reference each other. A typical workflow chains them:

```
/keyword-cluster keywords.csv        # Group keywords into clusters
/content-brief "target keyword"      # Brief for the top cluster
/schema-gen Article /blog/new-post   # Add structured data
/meta-optimizer /blog/new-post       # Optimize title and description
/internal-links sitemap.xml          # Connect to existing content
/seo-audit https://yoursite.com      # Verify everything passes
/ai-visibility --brand "you"         # Track AI citation pickup
/cannibalization --query "keyword"   # Confirm no overlap
```

---

## Installation Options

### curl (recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/ccforseo/seo-claude-code-skills/main/install.sh | bash
```

### Git clone

```bash
git clone https://github.com/ccforseo/seo-claude-code-skills.git
cd seo-claude-code-skills
./install.sh
```

### Manual

Copy any skill folder into `~/.claude/skills/`:

```bash
cp -r seo-audit ~/.claude/skills/seo-audit
```

### Multi-platform

```bash
./install.sh --target claude        # Claude Code (default)
./install.sh --target codex         # OpenAI Codex
./install.sh --target antigravity   # Antigravity
./install.sh --target all           # All platforms
```

---

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code), OpenAI Codex, or Antigravity
- Claude Pro, Max, or Team subscription
- macOS, Linux, or WSL

---

## SEO Command Center (Paid Kit)

These free skills analyze URLs and content you point them at. They work on their own.

**The [SEO Command Center](https://ccforseo.com/claude-code-for-seo) adds your own data.** Drop CSV exports from Google Search Console, GA4, and Google Ads into Claude Code. Ask questions about your rankings, traffic, and ad spend.

What the kit includes:

- CLAUDE.md configs for consultants, agencies, in-house teams, and developers
- 6 analysis templates (page 2 opportunities, CTR gaps, paid-organic overlap, content investment, AI cannibalization, bounce vs rank)
- Report templates (monthly SEO report, client onboarding, content calendar, AI visibility report)
- Data export guides for GSC, GA4, and Google Ads
- Client template with config.json for multi-client setups

Free skills analyze what you show them. The Command Center analyzes what you own.

**[Get the SEO Command Center](https://ccforseo.com/claude-code-for-seo)**

---

## Contributing

PRs welcome. Each skill lives in its own folder with a `SKILL.md` file.

**To add a skill:**

1. Create a folder: `your-skill-name/`
2. Add a `SKILL.md` (follow existing skills as examples)
3. Add `references/` subfolder if the skill needs reference data
4. Update the `SKILLS` array in `install.sh`
5. Update this README
6. Open a PR with a description and example command

**Rules:** One skill per folder. Lowercase, hyphenated names. One purpose per skill. Test with Claude Code before submitting.

---

## FAQ

### What is a Claude Code skill?

A skill is a SKILL.md file that acts as a reusable prompt. Type a slash command, Claude Code reads the file and follows its instructions. Skills live in `~/.claude/skills/` and work across all your projects.

### Do I need API keys or external tools?

No. These skills use Claude Code's built-in web fetching, file reading, and bash commands. No browser extensions, no third-party APIs.

### Can I modify the skills?

Yes. Each SKILL.md is plain text. Edit it to match your workflow, add checks, or change output formats.

### What's the difference between free skills and the paid Command Center?

Free skills analyze URLs and content you give them (audit this site, cluster these keywords). The [SEO Command Center](https://ccforseo.com/claude-code-for-seo) adds data analysis: drop GSC, GA4, and Ads exports into Claude Code and get insights from your own performance data.

---

<p align="center">
  Built by <a href="https://ccforseo.com">ccforseo.com</a><br>
  <sub>Claude Code SEO skills and workflows for marketers, developers, and agencies.</sub><br>
  <sub>Star the repo if these skills save you time.</sub>
</p>
