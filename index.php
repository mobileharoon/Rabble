<?php
session_start();
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Rabble!</title>
<style type="text/css" media="all">@import "look.css";</style>
</head>
<body>
<center>

<table class="maintable" cellpadding="0" cellspacing="0">
<tr><td class="banner" align="left"><img src="images/banner.gif"></td></tr>
<tr><td valign="top">
<?php
//////////////////////////////
///Check if admin logged in//
////////////////////////////
include 'connect.php';
$user = $_SESSION['uname'];
$pass = $_SESSION['pass'];
$query = "SELECT * FROM users WHERE uname = '$user' AND pass = '$pass'";
$result = pg_query($query);
$numrows = pg_numrows($result);
if ($numrows > 0){
// Do stuff if logged in
echo "
<div id=\"navcontaineradmin\">
<ul id=\"navlistadmin\">
<li><a href=\"index.php\">Home</a></li>
<li><a href=\"index.php?page=browse\">Browse</a></li>
<li><a href=\"index.php?page=licenses\">Department</a></li>
<li><a href=\"index.php?page=stats\">Statistics</a></li>
<li><a href=\"index.php?page=recent\">Updates</a></li>
<li><a href=\"index.php?page=add\">Add</a></li>
<li><a href=\"index.php?page=change\">Change</a></li>
<li><a href=\"index.php?page=delbuild\">Delete Building</a></li>
<li><a href=\"index.php?page=delroom\">Delete Room</a></li>
<li><a href=\"index.php?page=delsoft\">Delete Software</a></li>
<li><a href=\"logoff.php\">Logoff</a></li>
</ul></div>
";
}else{
// Do stuff if not logged in
echo "
<div id=\"navcontainer\">
<ul id=\"navlist\">
<li><a href=\"index.php\">Home</a></li>
<li><a href=\"index.php?page=browse\">Browse</a></li>
<li><a href=\"index.php?page=licenses\">Department</a></li>
<li><a href=\"index.php?page=stats\">Statistics</a></li>
<li><a href=\"index.php?page=recent\">Updates</a></li>
<li><a href=\"index.php?page=admin\">Admin</a></li>
</ul></div>
";
}
?>
</td></tr>
<tr><td align="left" valign="top">
<?php
if (isset($_GET['page'])){
$page = $_GET['page'];
$pageset = $page.".php";
include $pageset;
}else{
include 'home.php';
}
?>

</td></tr>
<tr id="footer"><td></td></tr>
<tr><td align="right" valign="middle"><p class=footertext>
<b>Rabble! 1.5</b> by Haroon Khalid
<img src=images/apache.gif> <img src=images/php.gif>
<img src=images/pgsql.gif> <img src=images/bsd.gif>
</p>
</td></tr>
</table>
</center>
</body>
