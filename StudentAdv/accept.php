<?php
session_start();
require('config.php');

if (isset($_GET['id'])) {
    $applicantId = $_GET['id'];

    // Perform the action to accept the application and set the status to "Accepted"
    $updateQuery = "UPDATE applicant SET status = 'Accepted' WHERE id = $applicantId";
    mysqli_query($conn, $updateQuery);

    // Redirect back to the Applicant Page after accepting the application
    header('Location: Applications.php');
} else {
    // Handle the case where the 'id' parameter is not provided in the URL.
    echo "Invalid request.";
}
?>
