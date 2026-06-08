<?php
  // register_user.php  -  saves a new user from register.html

  include "connect.php";

  // Get the form data
  $firstname = $_POST["firstname"];
  $lastname = $_POST["lastname"];
  $username = $_POST["username"];
  $pass = $_POST["pass"];

  // The checkbox is only sent when it is ticked
  $admin = 0;
  if (isset($_POST["administrator"])) {
    $admin = 1;
  }

  // Add the new user to the database
  $query = "INSERT INTO users (firstname, lastname, username, pass, administrator) VALUES ('" . $firstname . "', '" . $lastname . "', '" . $username . "', '" . $pass . "', " . $admin . ")";

  // Run the query and go to the right page
  if (mysqli_query($conn, $query)) {
    header("Location: login.html");
  } else {
    header("Location: query_error.html");
  }
?>
