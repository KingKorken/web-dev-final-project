<?php
  // connect.php  -  connects to our MySQL database.
  // Every PHP file that needs the database does: include "connect.php";

  $host = "localhost";
  $user = "root";
  $password = "";
  $database = "subscriptions_app";

  // Open the connection
  $conn = mysqli_connect($host, $user, $password, $database);

  // If it did not work, stop and show a message
  if (!$conn) {
    echo "Could not connect to the database.";
  }
?>
