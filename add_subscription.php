<?php
  // add_subscription.php  -  saves a new subscription from add_subscription.html

  session_start();

  // Only logged-in users can add a subscription
  if (!isset($_SESSION["username"])) {
    header("Location: login.html");
    exit;
  }

  include "connect.php";

  // Get the logged-in user and the form data
  $username = $_SESSION["username"];
  $service = $_POST["service"];
  $cost = $_POST["cost"];
  $billing_cycle = $_POST["billing_cycle"];
  $renewal_date = $_POST["renewal_date"];
  $sub_username = $_POST["sub_username"];
  $sub_password = $_POST["sub_password"];

  // Add the new subscription to the database
  $query = "INSERT INTO subscriptions (owner_username, service, cost, billing_cycle, renewal_date, sub_username, sub_password) VALUES ('" . $username . "', '" . $service . "', '" . $cost . "', '" . $billing_cycle . "', '" . $renewal_date . "', '" . $sub_username . "', '" . $sub_password . "')";

  if (mysqli_query($conn, $query)) {
    header("Location: dashboard.php");
  } else {
    header("Location: query_error.html");
  }
?>
