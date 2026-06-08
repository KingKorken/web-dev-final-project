<?php
  // login_check.php  -  checks the login from login.html

  session_start();
  include "connect.php";

  // Get the form data
  $username = $_POST["username"];
  $pass = $_POST["pass"];

  // Look for a user with this username and password
  $query = "SELECT * FROM users WHERE username = '" . $username . "' AND pass = '" . $pass . "'";
  $result = mysqli_query($conn, $query);

  // If exactly one user was found, the login is correct
  if (mysqli_num_rows($result) == 1) {
    // Remember who is logged in
    $_SESSION["username"] = $username;
    header("Location: dashboard.php");
  } else {
    header("Location: error_login.html");
  }
?>
