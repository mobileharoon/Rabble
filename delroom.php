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
// Include connection $ CSS vars
include 'connect.php';
include 'vars.php';

// Building query
$result = pg_query("SELECT * FROM building");
$step1 = "<select name=\"bname\">";
while ($row = pg_fetch_array($result)){
$step1 .= "<option value=\"".$row['id']."\">".$row['name']."</option>\n";
}
$step1 .= "</select>";

// Setting vars
$cell = "id=edit";
$bname = $_POST['bname'];
$self = "index.php?page=delroom";

///////Updating room 1/////////////////////////
echo "<p $classtitle>Delete Room</p><hr>";
echo "<form action=$self method=POST>";
echo "<p $classhead>Pick building first</p>";
echo "<table $classchange>";
echo "<tr><td $classtd>Name</td><td $classtd>$step1</td><td $classtd><input type=submit name=sub2a value=Submit></td></tr>";
echo "</table></form><br>";

/////////Updating room 2///////////////////////

if ($_POST['sub2a']){

// Setting vars
$bname = $_POST['bname'];

// Display checkbox list
$query = "SELECT * FROM room where bid = $bname ORDER by room_num";
$result = pg_query($query);
echo "<p $classblink>Pick room/s to delete</p>";
echo "<FORM action=$self method=post><table $classchange>";
echo "<tr><td $classnumber>Del.</td><td $classshort>Room #</td></tr>";
while ($row = pg_fetch_assoc($result)){
$room_num = $row['room_num'];
$id = $row['id'];
echo "<tr><td $classnumber><input type=checkbox name=roomnum[] value=$id></td><td $classlist>$room_num</td></tr>";
}
echo "<tr><td colspan=2 $classtd><input type=submit name=sub2b value=Delete></td></tr>";
echo "</table></form><br>";
}

if ($_POST['sub2b']){
$rooms = implode(",",$_POST['roomnum']);
echo "<p id=editbad>Are you sure you want to delete this/these?</p>";
echo "<a name=sub2b>";
echo "<form action=$self method=post><input type=hidden name=room value=$rooms><input type=submit name=sub2c value=Yes></form><br><br>";
echo "<META HTTP-EQUIV=Refresh CONTENT=\"0; URL=$self#sub2b\">";
}

if ($_POST['sub2c']){
$rooms = $_POST['room'];
$query = "DELETE FROM room WHERE id IN ($rooms)";
$result = pg_query($query);
echo "<a name=sub2c>";
echo "<p id=editbad>Deleted! <a href=$self>Click here to refresh page</a></p><br>";
echo "<META HTTP-EQUIV=Refresh CONTENT=\"0; URL=$self#sub2c\">";
}

?>

