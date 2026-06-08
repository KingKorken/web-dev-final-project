# Subscription Tracker

A simple website to keep track of all your subscriptions (Netflix, Spotify,
Claude, ...) and see how much you spend per month and per year.

Built for our Mobile & Web Development course using only basic HTML, CSS,
JavaScript, PHP and MySQL. See `CODING_STANDARD.md` and `DESIGN_STANDARD.md`
for the level we keep to.

## What it does

- Create an account and log in.
- Add subscriptions (service, cost, monthly/yearly, renewal date, login info).
- See all your subscriptions in a table.
- See a recap: how much you spend per month and per year.
- Delete a subscription.

## How to run it (with XAMPP or MAMP)

You need PHP and MySQL, so the easiest way is a free tool like
**XAMPP** (Windows/Mac) or **MAMP** (Mac).

1. Install XAMPP / MAMP and start **Apache** and **MySQL**.
2. Copy this whole folder into the server's web folder
   (XAMPP: `htdocs`, MAMP: `htdocs`).
3. Open phpMyAdmin (usually `http://localhost/phpmyadmin`) and **import**
   `database.sql`. This creates the database, the tables and some sample data.
4. In a browser go to `http://localhost/<folder-name>/login.html`.
5. Log in with the sample account, or create your own:
   - Username: `tim`
   - Password: `demo1234@`

## Important

- **Only ever type FAKE usernames and passwords** for your services. This is a
  school project: the database stores them as plain text, so never use your real
  account details.
- The login is not secure (no password hashing) on purpose — that is above the
  level we have learned. It is fine for a class demo, not for real use.

## Main files

| File | What it is |
|------|------------|
| `database.sql` | Creates the database and tables |
| `connect.php` | Connects to the database |
| `login.html` / `login_check.php` | Log in |
| `register.html` / `register_user.php` | Create an account |
| `dashboard.php` | The main page: list + spending recap |
| `add_subscription.html` / `add_subscription.php` | Add a subscription |
| `delete_subscription.php` | Delete a subscription |
| `logout.php` | Log out |
| `style.css` | Shared styles |
