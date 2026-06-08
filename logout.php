<?php
  // logout.php  -  logs the user out and returns to the login page

  session_start();
  session_destroy();
  header("Location: login.html");
?>
