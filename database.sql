-- ============================================================
-- database.sql  -  Subscription tracker
-- ============================================================
-- Run this once to create the database and its two tables.
-- It only uses basic SQL: CREATE TABLE, INSERT, and simple types.
-- No JOINs, no SUM(), no advanced features (see CODING_STANDARD.md).
--
-- How the two tables connect (the beginner way):
--   We do NOT join tables. Each subscription simply stores the
--   username of the person it belongs to (owner_username). To get
--   one person's subscriptions we use a simple WHERE filter.
-- ============================================================


-- Create and use the database
CREATE DATABASE subscriptions_app;
USE subscriptions_app;


-- ------------------------------------------------------------
-- Table 1: users  (people who log in to OUR app)
-- These columns match our new_user.html / login.html forms.
-- ------------------------------------------------------------
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  username VARCHAR(50),
  pass VARCHAR(50),
  administrator INT          -- 0 = normal user, 1 = administrator
);


-- ------------------------------------------------------------
-- Table 2: subscriptions  (one row per subscription a user adds)
--
-- owner_username  = which app user this subscription belongs to
-- service         = "Netflix", "Spotify", "Claude", ...
-- cost            = price for ONE billing period (e.g. 9.99)
-- billing_cycle   = "monthly" or "yearly"
-- renewal_date    = next payment date
-- sub_username    = the login you use for that service  (FAKE DATA ONLY)
-- sub_password    = the password for that service       (FAKE DATA ONLY)
--
-- !! NEVER put a real password here. The database stores it as plain
-- !! text. Use made-up demo values only.
-- ------------------------------------------------------------
CREATE TABLE subscriptions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  owner_username VARCHAR(50),
  service VARCHAR(50),
  cost DECIMAL(6,2),         -- money: up to 9999.99  (2 decimal places)
  billing_cycle VARCHAR(10),
  renewal_date DATE,
  sub_username VARCHAR(50),
  sub_password VARCHAR(50)
);


-- ------------------------------------------------------------
-- Some sample rows so we have something to show on screen.
-- (All fake data.)
-- ------------------------------------------------------------
INSERT INTO users (firstname, lastname, username, pass, administrator)
VALUES ('Tim', 'Buhrow', 'tim', 'demo1234@', 1);

INSERT INTO subscriptions
  (owner_username, service, cost, billing_cycle, renewal_date, sub_username, sub_password)
VALUES
  ('tim', 'Netflix', 13.99, 'monthly', '2026-07-01', 'tim.fake@mail.com', 'fakepass1@'),
  ('tim', 'Spotify', 9.99,  'monthly', '2026-07-05', 'tim.fake@mail.com', 'fakepass2@'),
  ('tim', 'Claude',  18.00, 'monthly', '2026-07-10', 'tim.fake@mail.com', 'fakepass3@'),
  ('tim', 'Amazon Prime', 89.90, 'yearly', '2027-01-15', 'tim.fake@mail.com', 'fakepass4@');


-- ============================================================
-- Example queries we will use in our PHP files
-- (kept simple: SELECT / INSERT / UPDATE / DELETE with WHERE)
-- ============================================================

-- Get every subscription that belongs to the logged-in user:
--   SELECT * FROM subscriptions WHERE owner_username = 'tim';

-- Add a new subscription:
--   INSERT INTO subscriptions
--     (owner_username, service, cost, billing_cycle, renewal_date, sub_username, sub_password)
--   VALUES ('tim', 'Disney+', 8.99, 'monthly', '2026-08-01', 'demo', 'demo@1');

-- Change the price of one subscription:
--   UPDATE subscriptions SET cost = 10.99 WHERE id = 2;

-- Delete one subscription:
--   DELETE FROM subscriptions WHERE id = 2;

-- NOTE: the "how much per month / per year" recap is NOT done in SQL.
-- We read the rows with the SELECT above, then add the costs up with a
-- normal loop in PHP (monthly cost as-is; yearly cost divided by 12).
