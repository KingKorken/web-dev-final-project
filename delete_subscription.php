<?php
  // delete_subscription.php  -  removes one subscription

  session_start();

  // Only logged-in users can delete
  if (!isset($_SESSION["username"])) {
    header("Location: login.html");
    exit;
  }

  include "connect.php";

  // Which subscription to delete (comes from the link in the table)
  $id = $_GET["id"];
  $username = $_SESSION["username"];

  // Only delete it if it belongs to the logged-in user
  $query = "DELETE FROM subscriptions WHERE id = " . $id . " AND owner_username = '" . $username . "'";
  mysqli_query($conn, $query);

  header("Location: dashboard.php");
?>
