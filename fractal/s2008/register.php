<?php
$connection = mysql_connect("firefly.cs.du.edu", "fractal", "crisp");
if (! $connection)
  die("Failed to connect to database: " . mysql_error());
@mysql_select_db("fractal", $connection) or die("Unable to select database");
$first = mysql_real_escape_string($_POST['firstname']);
$last =  mysql_real_escape_string($_POST['lastname']);
$org = mysql_real_escape_string( $_POST['organization']);
$email =  mysql_real_escape_string($_POST['email']);
$query = "INSERT INTO fractal VALUES(\"$first\",\"$last\",\"$org\",\"$email\", NOW())";
mysql_query($query, $connection) or die("Failed to insert registration data into databse");
header("Location: http://www.cs.du.edu/fractal/");
?>
