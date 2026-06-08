# Contributing to this project

Thanks for working on our Mobile & Web Development project. To keep the whole
codebase at the level we have actually learned in class, **every contribution
must follow [`CODING_STANDARD.md`](CODING_STANDARD.md).**

It must also **look** like our class work, so follow
[`DESIGN_STANDARD.md`](DESIGN_STANDARD.md) for the visual side (plain, basic,
slightly old-fashioned — no modern or AI-looking designs).

Please read both files first. The rules below are how we keep to them as a team.

---

## The one rule that matters most

**You must be able to explain every line you commit.**

If a teacher asks "walk me through this function," you should be able to do it
without notes. No tool, checklist, or formatting trick replaces actually
understanding your own code. If you can't explain it, don't commit it — ask the
group to go through it with you first.

---

## How we work

1. **Never push straight to `main`.** Make a branch and open a Pull Request.
   ```
   git checkout -b my-feature
   # ...make your changes...
   git add -A
   git commit -m "Short description of what I did"
   git push -u origin my-feature
   ```
   Then open a Pull Request on GitHub.

2. **Run the checker before you push.** From the project folder:
   ```
   bash check_standard.sh
   ```
   It scans every `.html`, `.css`, and `.js` file and flags anything that is
   above our level (flexbox, `addEventListener`, arrow functions, `fetch`, and
   so on — see `CODING_STANDARD.md`). Fix what it reports, or ask the group.

3. **Fill in the Pull Request checklist.** It appears automatically when you
   open a PR. Tick every box honestly.

4. **Get one teammate to review** before merging. The reviewer checks the code
   against the standard *and* that the author understands it.

---

## What "above our level" means

Short version (full list in `CODING_STANDARD.md`):

- **JavaScript:** use `function`, `getElementById`, inline `onclick`/`onchange`,
  `alert`, simple `if`/`for...of`. **No** arrow functions, `addEventListener`,
  `querySelector`, `fetch`, array methods, classes, or template literals.
- **CSS:** use the box model, colours, `:hover`, `border-radius`, `box-shadow`.
  **No** flexbox, grid, `position`, animations, media queries, or variables.
- **HTML:** use `<div>`, `<section>`, `<table>`, forms, basic tags. **No**
  `<header>`/`<nav>`/`<main>`, `aria-*`, `role=`, or `data-*`.

If the only way to do something is with a technique we haven't learned, **stop
and raise it with the group** instead of sneaking in advanced code.

---

## Commit messages

Keep them short, plain, and in your own words, e.g.:

```
Add phone number validation to the registration form
Fix login button colour
```

That's it. Keep it simple, keep it ours.
