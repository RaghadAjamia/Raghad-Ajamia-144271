<?php
include 'main.php';
include 'participant_p.php';
include 'admin_p.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Include the main PHPMailer class file
require 'path/to/PHPMailer/PHPMailer.php';
require 'path/to/PHPMailer/SMTP.php';
require 'path/to/PHPMailer/Exception.php';


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "participant_userName";

$conn = new mysqli($servername, $username, $password, $database);
// trying to send the email 
  $receiving_email_address = 'raghadaboajamia@gmail.com';

  if( file_exists($php_email_form = '../assets/vendor/php-email-form/php-email-form.php' )) {
    include( $php_email_form );
  } else {
    die( 'Unable to load the "PHP Email Form" Library!');
  }

 

$contact = new PHPMailer(true);

$contact->isSMTP();
$contact->SMTPAuth = true;

$contact->Host = 'smtp.example.com'; // Replace with your SMTP host
$contact->Username = 'your_username'; // Replace with your SMTP username
$contact->Password = 'your_password'; // Replace with your SMTP password
$contact->Port = 587; // Replace with your SMTP port

$contact->SMTPSecure = 'tls'; // Replace with 'ssl' if required

// Example email sending code
$contact->setFrom('your_email@example.com', 'Your Name');
$contact->addAddress('recipient@example.com', 'Recipient Name');
$contact->Subject = 'Subject of your email';
$contact->Body = 'Body of your email';

try {
    $contact->send();
    echo "Message sent!";
} catch (Exception $e) {
    echo "Mailer Error: " . $contact->ErrorInfo;
}

  

  $contact->add_message( $_POST['name'], 'From');
  $contact->add_message( $_POST['email'], 'Email');
  $contact->add_message( $_POST['message'], 'Message', 10);

  echo $contact->send();
?>
