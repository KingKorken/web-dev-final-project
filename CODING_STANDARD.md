# Coding Standard — Skill Limit for AI Assistance

> **Read this file before writing any code for this project.**
> Its purpose is to keep all generated code at the level we have actually
> learned in our "Mobile and Web Development" course. The goal is **not** to
> write the best or most modern code possible — it is to write code that looks
> like *we* could have written it by hand, using only the techniques shown in
> our class examples.
>
> This file covers which code *techniques* we may use. For how the finished page
> should *look* (plain, basic, slightly dated — not modern or AI-looking), see
> the companion file **`DESIGN_STANDARD.md`**.

---

## 1. The golden rule

**Always write the most basic version that works.** If there is a simple,
beginner way and a "better"/advanced way to do something, **always choose the
beginner way**, even if it is longer or less efficient. When in doubt, write
*less* clever code, not more.

Match the style of the example code in this document exactly:
- Same level of simplicity
- Same naming style
- Same patterns (inline event handlers, `getElementById`, plain functions, etc.)

If a task genuinely cannot be solved with the techniques in the "✅ Allowed"
lists below, **stop and tell us** instead of reaching for an advanced technique.
Do not silently introduce something we have not learned.

---

## 2. Languages we use

| Language   | What we use it for                                  |
|------------|-----------------------------------------------------|
| HTML       | Page structure, forms, tables, images, links        |
| CSS        | Styling (in a `<style>` block or a `style.css` file) |
| JavaScript | Simple form validation in the browser               |
| PHP        | Server-side form handling + database (login system)  |
| MySQL/SQL  | Storing and checking users (basic queries)           |

We do **not** use any other languages, frameworks, libraries, or tools.

---

## 3. HTML

### ✅ Allowed
- Basic structure: `<!DOCTYPE html>`, `<html>`, `<head>`, `<body>`
- `<meta charset>`, `<meta name="viewport">`, `<title>`, `<link rel="stylesheet">`
- Text tags: `<h1>`–`<h4>`, `<p>`, `<b>`, `<i>`, `<u>`, `<hr>`, `<br>`
- `<a href>` links (including `target="_blank"`)
- `<img src>` images
- Containers: `<div>`, `<section>`
- `<table>`, `<tr>`, `<td>` — **tables are an OK way to line up a form**
- Forms: `<form method="POST" action="something.php">`
- Inputs: `type="text"`, `password`, `date`, `radio`, `checkbox`, `submit`, `button`
- `<select>` with `<option>`
- `placeholder`, `required`, `value`, `checked`, `name`, `id`, `class`
- Inline event handlers: `onclick="..."`, `onchange="..."`
- Classes and IDs to connect HTML with CSS and JavaScript

### ❌ Not allowed (we have not learned these)
- Semantic layout tags like `<header>`, `<nav>`, `<main>`, `<footer>`, `<article>`, `<aside>`
- `<canvas>`, `<svg>`, `<video>`, `<audio>`
- `data-*` attributes
- Accessibility attributes like `aria-*`, `role=`
- Template/`<dialog>`/`<details>` and other modern elements

---

## 4. CSS

### ✅ Allowed
- A `<style>` block in the `<head>`, **or** a separate `style.css` linked file
- Selectors: by element (`body`, `td`), by class (`.divstyle`), by id, and
  by attribute (`input[type="text"]`)
- Box model: `width`, `height`, `margin`, `padding`, `border`
- Colors: named colors, hex (`#333`, `#4caf50`), and `rgba(...)`
- `background-color`, `background`, `color`
- `font-family`, `font-size`, `font-weight`, `text-align`
- `border-radius`, `box-shadow`
- `box-sizing: border-box`
- `:hover` state
- `cursor: pointer`
- `max-width` + `margin: 0 auto` to center a block

### ❌ Not allowed (we have not learned these)
- **Flexbox** (`display: flex`) and **CSS Grid** (`display: grid`)
- `position: absolute / relative / fixed / sticky`
- CSS variables (`--my-color`)
- `transition`, `animation`, `@keyframes`, `transform`
- Media queries (`@media`) / responsive breakpoints
- `calc()`, `clamp()`, `min()`, `max()`
- Pseudo-elements `::before` / `::after`
- Importing fonts (Google Fonts, `@import`, `@font-face`)

---

## 5. JavaScript

This is the area where it is easiest to accidentally go too advanced. **Keep it
very simple.** Our JavaScript is only used for basic form validation and simple
page redirects.

### ✅ Allowed
- Variables with `let` (and `const` only if it feels natural; prefer `let`)
- Plain functions: `function validateEmail() { ... }`
- Getting/setting values: `document.getElementById("email").value`
- Reading a checkbox: `document.getElementById("terms").checked`
- `.focus()` on an element
- `alert("message")` to show messages to the user
- `if` / `else` statements
- `for (let x of something) { ... }` loops
- Comparisons: `==`, `!=`, `===`, `!==`, `<`, `>`
- String things: `.length`, `.includes("@")`, `.indexOf("@")`, `.charAt(0)`
- Numbers: `isNaN(value)`
- Dates (basic only): `new Date()`, `new Date(someString)`, comparing two dates
- Inline handlers in the HTML: `onclick="validateTerms()"`, `onchange="..."`
- Page navigation: `window.location.href = 'login.html'` and `history.go(-1)`
- `<script>` block inside the `<head>`

### ❌ Not allowed (we have not learned these)
- Arrow functions (`() => {}`)
- `addEventListener(...)` — **use inline `onclick` / `onchange` instead**
- `querySelector` / `querySelectorAll` — **use `getElementById` instead**
- `fetch`, AJAX, `XMLHttpRequest`, promises, `async` / `await`
- Creating or removing elements (`createElement`, `appendChild`, `innerHTML` building)
- Array methods like `.map()`, `.filter()`, `.forEach()`, `.reduce()`
- Objects/JSON handling, `JSON.parse`, `JSON.stringify`
- Classes (`class Foo {}`), modules (`import` / `export`)
- Regular expressions (`/.../`, `.match()`, `.test()`)
- Template literals (backtick strings `` `Hello ${name}` ``) — use `"normal " + strings`
- Ternary operator `a ? b : c` (use a full `if/else`)
- External JS libraries (jQuery, React, Vue, etc.)

### Example of our JavaScript style (copy this style exactly)

```javascript
// Validate email
function validateEmail() {
  let email = document.getElementById("email").value;

  // Check if the email contains '@'
  if (email.indexOf("@", 0) == -1) {
    alert("The email must contain '@'.");
    document.getElementById("email").value = "";
    document.getElementById("email").focus();
    return;
  }
}
```

Notes on the style above: short comments above each block, `let` variables,
`getElementById`, `alert()` for messages, clearing the field and calling
`.focus()` on error, simple `if` checks. **All our JavaScript should look like
this.**

---

## 6. PHP (server side)

We use PHP only to handle form submissions and talk to a database for our
login/registration system. Keep it to **simple, procedural PHP** — no classes,
no frameworks.

### ✅ Allowed
- `<?php ... ?>` blocks
- Reading form data: `$_POST["username"]`, `$_GET[...]`
- Variables: `$username = $_POST["username"];`
- `echo` to output text/HTML
- `if` / `else`, `for`, `while`
- String joining with `.` (e.g. `"Hello " . $name`)
- Connecting to a MySQL database and running a simple query
- Redirecting after a form: `header("Location: welcome.html");`
- Basic includes if needed: `include "something.php";`

### ❌ Not allowed (we have not learned these)
- Object-oriented PHP (`class`, `new`, `->` on our own objects)
- Frameworks (Laravel, Symfony, etc.) or Composer packages
- Prepared statements / PDO *if* the class only taught plain `mysqli_query`
  — **match whatever the teacher showed us in class.** If unsure, ask.
- Sessions, cookies, password hashing functions, etc., **unless** we were
  explicitly taught them — ask first.
- APIs / JSON responses / building a REST backend

> ⚠️ We have not written PHP files in this folder yet. Before writing any PHP,
> **ask us to show the example the teacher gave**, and match it exactly. Do not
> assume a "professional" approach.

---

## 7. SQL / Database

### ✅ Allowed
- `CREATE TABLE` with simple column types (`INT`, `VARCHAR`, `DATE`, and
  `DECIMAL(x,2)` for prices/money)
- A simple `PRIMARY KEY` with `AUTO_INCREMENT` for the `id` column
- `SELECT ... FROM ... WHERE ...`
- `INSERT INTO ... VALUES (...)`
- `UPDATE` / `DELETE` with a simple `WHERE`

### ❌ Not allowed (unless explicitly taught)
- `JOIN`s across multiple tables
- Subqueries, `GROUP BY`, `HAVING`, aggregate functions
- Indexes, views, stored procedures, triggers, transactions

---

## 8. General habits to keep

- **Comments**: write short, plain comments above blocks, like in our examples.
- **Names**: simple, descriptive names (`validatePassword`, `email`, `phone`).
- **No build tools**: no npm, Node, bundlers, TypeScript, or compilers. Files
  open directly in a browser (or run on a basic PHP/MySQL server).
- **One file at a time**: plain `.html`, `.css`, `.php`, `.sql` files. No folders
  full of config.
- **If something needs an advanced technique to work properly, tell us** rather
  than writing code we could not have written or explained ourselves.

---

## 9. Quick checklist before giving us code

Before sharing any code, the AI should confirm:

- [ ] Does every piece of this appear in the ✅ "Allowed" lists above?
- [ ] Did I use `getElementById` (not `querySelector`) and inline `onclick`
      (not `addEventListener`)?
- [ ] Did I avoid flexbox, grid, arrow functions, fetch, and template literals?
- [ ] Does this look like the example code in Section 5?
- [ ] If I needed anything advanced, did I stop and ask instead?

If any box is unchecked, simplify the code or ask us first.
