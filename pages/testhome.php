<?php 
session_start();
echo $_SESSION[userID];
echo $_SESSION[acctID];
echo $_SESSION[email];
echo file_get_contents('./home.html');

?>