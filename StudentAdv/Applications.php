<?php
session_start();
require('config.php');

// Check if the form for accepting an applicant is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['accept_applicant'])) {
    $studentno = $_SESSION['studentno']; // Assuming the adviser's studentno is stored in the session
    $id = $_POST['id']; // Assuming the applicant's id is sent via a form field named 'applicant_id'
    
    // Update the applicant's accepted_by column
    $update_query = "UPDATE applicant SET accepted_by = '$studentno' WHERE id = '$id'";
    mysqli_query($conn, $update_query);
}
?>

<!DOCTYPE HTML>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        <?php include "CSS.css" ?>
    </style>
    <title>Home</title>
</head>
<body>
<div id="header">
    <?php
    if (isset($_SESSION['studentno']) || isset($_SESSION['employeeid'])) {
        echo "<div style='float:right;'>Welcome, ";
        if (isset($_SESSION['studentno'])) {
            // Display student's name
            $name_query = mysqli_query($conn, "SELECT firstname FROM adviser WHERE studentno = '" . $_SESSION['studentno'] . "'");
            $position = "Adviser";
        } elseif (isset($_SESSION['employeeid'])) {
            // Display employee's name
            $name_query = mysqli_query($conn, "SELECT firstname FROM admin WHERE employeeid = '" . $_SESSION['employeeid'] . "'");
            $position = "Admin";
        }
        $name_result = mysqli_fetch_assoc($name_query);
        echo "<strong>" . $position . " " . $name_result['firstname'] . "</strong>";
        echo "</div>";
    }
    ?>
    <center>
        <h1>MAPUA UNIVERSITY</h1>
        <br/>
        <h1>COUNCIL OF STUDENT ADVISING</h1>
        <hr class="medium">
        <a href="Home.php" class="header">Home</a> |
        <a href="Announcements.php" class="header">Events/Announcements</a> |
        <div class="dropdown">
            <?php
              if (isset($_SESSION['employeeid'])) {
                echo "
                <button class=\"dropbtn\">Register</button> |
                <div class=\"dropdown-content\">
                    <a href=\"adviserRegister.php\">Adviser</a>
                    <a href=\"adminRegister.php\">Admin</a>
                </div>";
            }
            ?>

        </div>
        <div class="dropdown">
            <button class="dropbtn">Login</button> |
            <div class="dropdown-content">
                <?php
                if (isset($_SESSION['studentno']) || isset($_SESSION['employeeid'])) {
                    echo "<a href=\"logout.php\">Logout</a>";
                } else {
                    echo "<a href=\"adviserLogin.php\">Adviser</a>";
                    echo "<a href=\"adminLogin.php\">Admin</a>";
                }
                ?>
            </div>
        </div>
        <a href="Apply.php" class="header">Apply</a>
        <?php
        // Check if either session variable is set
        if (isset($_SESSION['studentno']) || isset($_SESSION['employeeid'])) {
            echo " | <a href=\"Applications.php\" class=\"header\">Applications</a>";
        }
        ?>
        <hr class="medium">
</div><br/>

<div class=body><br/>
    <h2> Applicant Page </h2>
    <table align=center>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Specialization</th>
            <th>Preferred Day</th>
            <th>Preferred Time</th>
            <th>Preferred Mentor</th>
            <th>Status</th>
            <th>Accepted By</th>
            <th>Actions</th>
            <th>Actions</th>
        </tr>
        <?php
        // Fetch applicants with adviser names
        $query = mysqli_query($conn, "SELECT a.*, b.firstname AS adviser_firstname FROM applicant a LEFT JOIN adviser b ON a.accepted_by = b.studentno");

        while($row = mysqli_fetch_array($query))
        {
            Print "<tr>";
            Print '<td align="center">'. $row['name'] . "</td>";
            Print '<td align="center">'. $row['email'] . "</td>";
            Print '<td align="center">'. $row['phone']."</td>";
            Print '<td align="center">'. $row['spec']."</td>";
            Print '<td align="center">'. $row['pref_day']. "</td>";
            Print '<td align="center">'. $row['pref_time']. "</td>";
            Print '<td align="center">'. $row['pref_mentor']. "</td>";
            Print '<td align="center">'. $row['status']. "</td>";
            Print '<td align="center">'. ($row['adviser_firstname'] ? $row['adviser_firstname'] : 'Not Accepted Yet') . "</td>";
            Print '<td align="center"><a href="accept.php?id='. $row['id'] .'">accept</a> </td>';
            Print '<td align="center"><a href="delete.php?id='. $row['id'] .'">delete</a> </td>';
            Print "</tr>";
        }

        ?>
    </table>

</div><br/><br/>
</body>
</html>