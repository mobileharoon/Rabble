<?php


/***************************************************************************
Copyright (c) 2006, Rabble!, Haroon Khalid
All rights reserved.

Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, 
this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright 
notice, this list of conditions and the following disclaimer in the 
documentation and/or other materials provided with the distribution.
    * Neither the name of the Rabble! nor the names of its contributors 
may be used to endorse or promote products derived from this software without 
specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE 
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
***************************************************************************/

// start the session
session_start();
//header("Cache-control: private"); //IE 6 Fix
include 'connect.php';
$user = $_SESSION['uname'];
$pass = $_SESSION['pass'];
$query = "SELECT * FROM users WHERE uname = '$user' AND pass = '$pass'";
$result = pg_query($query);
$numrows = pg_numrows($result);
if ($numrows < 1){
header("Location: denied.php");
exit;
}else{

}
?>
<?php
$self = "index.php?page=delbuild";
include 'connect.php';
include 'vars.php';
echo "<p $classtitle>Delete Building</p><hr>";
$query = "SELECT * FROM building ORDER BY name";
$result = pg_query($query);
$numrows = pg_num_rows($result);
if ($numrows < 1){
echo "<p id=editbad>No records!</p>";
}else{
echo "<FORM action=$self method=post>";
echo "<table $classchange>";
echo "<tr><td $classnumber>Del.</td><td $classshort>Name</td></tr>";
while ($row = pg_fetch_assoc($result)){
$id = $row['id'];
$building = $row['name'];
echo "<tr><td $classlist><input type=checkbox name=building[] value=$id></td><td $classlist>$building</td></tr>";
}
echo "<tr><td colspan=2 $classtd><input type=submit name=sub1></td></tr>";
echo "</table></FORM><br>";
}

if ($_POST['sub1']){
$buildings = implode(",",$_POST['building']);
echo "<p id=editbad>Are you sure you want to delete this/these?</p>";
echo "<a name=sub1>";
echo "<form action=$self method=post><input type=hidden name=building value=$buildings><input type=submit name=sub2 value=Yes></form><br><br>";
echo "<META HTTP-EQUIV=Refresh CONTENT=\"0; URL=$self#sub1\">";
}

if ($_POST['sub2']){
$buildings = $_POST['building'];
$query = "DELETE FROM building WHERE id IN ($buildings)";
$result = pg_query($query);
echo "<a name=sub2>";
echo "<p id=editbad>Deleted! <a href=$self>Click here to refresh page</a></p><br>";
echo "<META HTTP-EQUIV=Refresh CONTENT=\"0; URL=$self#sub2\">";
}

?>

