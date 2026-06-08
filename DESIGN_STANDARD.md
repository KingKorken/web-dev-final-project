# Design Standard — How Our Websites Should LOOK

> **Read this together with `CODING_STANDARD.md` before designing any page.**
> That file limits which CSS *techniques* we may use. This file limits how the
> finished page should *look*. Both have the same goal: the result must look
> like something **we** built in class with basic CSS — not like a modern,
> professional, or AI-generated website.

---

## 1. The golden rule of design

**It should look plain and a little dated — like an early-2000s / school-exercise
website.** If a page looks like a polished startup landing page, a modern app, or
a slick template, it is **wrong** for this project, even if it's "nicer".

When choosing how something looks, always pick the **plainer** option.

---

## 2. What our pages actually look like

Use these as the picture in your head:

- A white or very light grey background.
- Black or dark grey text in a **default system font** (Arial / Times New Roman /
  sans-serif). No custom or downloaded fonts.
- Content stacked straight down the page, or lined up with a `<table>`.
- Plain headings (`<h1>`–`<h4>`), normal paragraphs, simple links.
- Simple form fields and one coloured button.
- Lots of plain space; not much decoration.

The most "designed" page we have is the registration form
(`Code Standard/new_user_final.html`): a centred white box, thin grey border,
slightly rounded corners, a light shadow, a green submit button that darkens on
hover. **That is the absolute ceiling of polish.** Do not go beyond it.

---

## 3. Allowed look (✅)

- **Fonts:** `Arial`, `Times New Roman`, `Verdana`, `sans-serif`, `serif` — the
  fonts already on every computer. Plain sizes (`14px`, `16px`, etc.).
- **Colours:** a few solid colours, named or hex (`#333`, `#f9f9f9`, `#4caf50`).
  Keep the palette small and flat.
- **Layout:** content stacked top-to-bottom, or arranged with `<table>` rows.
  A single centred box using `max-width` + `margin: 0 auto`.
- **Boxes:** a thin solid `border`, a little `padding`, optional small
  `border-radius`, optional **light** `box-shadow` (like the form). One at a time,
  not on everything.
- **Buttons:** a solid background colour, white text, simple `:hover` that just
  changes the colour. Nothing more.
- **Spacing:** plain `margin` and `padding` in round pixel numbers.

---

## 4. NOT allowed look (❌) — these make it look modern / AI-made

Avoid all of these, because we never made them in class and they give the game
away:

- **Downloaded / web fonts** — Google Fonts, `@font-face`, icon fonts. Use the
  default system fonts only.
- **Icons and graphics** — Font Awesome, SVG icons, emoji used as buttons/icons,
  logo graphics. Plain text labels only.
- **Gradients** — `linear-gradient`, `radial-gradient`. Use a single flat colour.
- **Fancy shadows / effects** — big glows, blur, glassmorphism, semi-transparent
  panels. (A single light shadow like the form is the most we do.)
- **Modern layout patterns** — hero banners, full-width cover images, card grids,
  multi-column responsive layouts, sticky/fixed navbars, sidebars, footers that
  span the page.
- **Animations** — hover slides, fade-ins, things that move or transition.
- **Responsive / mobile design** — breakpoints, "looks great on every screen".
  Our pages are just fixed, simple pages.
- **Dark mode / theme switchers.**
- **CSS frameworks / templates** — Bootstrap, Tailwind, Bulma, Materialize, any
  CDN stylesheet. We write our own plain CSS only.
- **Rounded everything, heavy colour, trendy palettes, big bold hero text.**

---

## 5. The smell test (ask before you finish a page)

- Could a beginner make this in a single CSS file after a few classes? If not,
  it's too advanced.
- Does it look like a real company/startup website? If yes, **make it plainer.**
- Did I add a font, icon, gradient, animation, or grid? If yes, **remove it.**
- Does it look like our `new_user_final.html` form or simpler? Good. More polished
  than that? **Tone it down.**

When unsure, strip decoration out rather than adding it in.

---

## 6. Quick checklist before sharing a design

- [ ] Default system fonts only (no Google Fonts / `@font-face`).
- [ ] No icons, SVGs, or emoji used as UI.
- [ ] Flat solid colours only — no gradients.
- [ ] Layout is stacked or a simple `<table>` — no flexbox/grid, no cards.
- [ ] No animations, transitions, or responsive breakpoints.
- [ ] At most as polished as `new_user_final.html`.
- [ ] It looks a bit plain/old — which is exactly what we want.
