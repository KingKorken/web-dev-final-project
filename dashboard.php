<?php
  // dashboard.php  -  shows the user's subscriptions and the spending recap

  session_start();

  // If nobody is logged in, send them back to the login page
  if (!isset($_SESSION["username"])) {
    header("Location: login.html");
    exit;
  }

  include "connect.php";

  $username = $_SESSION["username"];

  // Get all subscriptions that belong to this user (simple WHERE, no JOIN)
  $query = "SELECT * FROM subscriptions WHERE owner_username = '" . $username . "'";
  $result = mysqli_query($conn, $query);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css" />
    <title>My Subscriptions</title>
</head>
<body>
    <div class="box">
        <h1>My Subscriptions</h1>
        <p>Logged in as: <?php echo $username; ?></p>

        <table>
            <tr>
                <th>Service</th>
                <th>Cost</th>
                <th>Billing</th>
                <th>Renewal date</th>
                <th>Per month</th>
                <th></th>
            </tr>

            <?php
              // We add up the monthly cost while we print each row
              $monthly_total = 0;

              while ($row = mysqli_fetch_assoc($result)) {
                // Work out the monthly cost of this subscription
                $monthly = $row["cost"];
                if ($row["billing_cycle"] == "yearly") {
                  $monthly = $row["cost"] / 12;
                }

                $monthly_total = $monthly_total + $monthly;

                // Print one table row
                echo "<tr>";
                echo "<td>" . $row["service"] . "</td>";
                echo "<td>" . $row["cost"] . " EUR</td>";
                echo "<td>" . $row["billing_cycle"] . "</td>";
                echo "<td>" . $row["renewal_date"] . "</td>";
                echo "<td>" . round($monthly, 2) . " EUR</td>";
                echo "<td><a href='delete_subscription.php?id=" . $row["id"] . "'>Delete</a></td>";
                echo "</tr>";
              }

              // The yearly total is just the monthly total times 12
              $yearly_total = $monthly_total * 12;
            ?>
        </table>

        <h4>You spend about <?php echo round($monthly_total, 2); ?> EUR per month
            (<?php echo round($yearly_total, 2); ?> EUR per year).</h4>

        <p><a href="add_subscription.html">Add a subscription</a></p>
        <p><a href="logout.php">Log out</a></p>
    </div>
</body>
</html>
