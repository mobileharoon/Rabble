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
// Include connection
include 'connect.php';

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
$self = "index.php?page=delete";

echo "<p id=header>Deleting</p>";

// Updating building 1
echo "<p id=edithead>Building</p>";
echo "<form action=$self method=POST>";
echo "<table><tr><td $cell><p id=edithead>Building</p></td><td $cell>$step1</td><td $cell><input type=submit name=sub1a value=Delete></td></tr>";
echo "</table>";
echo "</form>";


// Updating building 2
if ($_POST['sub1a']){
$bname = $_POST['bname'];
$query = "SELECT id,name FROM building WHERE id = $bname";
$result = pg_query($query);
while($row = pg_fetch_assoc($result)){
$name = $row['name'];
echo "<p id=editbad>Are you sure you want to delete this?</p>";
echo "<form action=$self method=POST>";
echo "<table><tr><td $cell><p id=edithead>Name</p></td><td $cell><p id=edithead>$name</p><input type=hidden name=bname value=$bname><input type=hidden name=name 
value=$name></td><td $cell><input 
type=submit name=sub1b value=Yes Delete!></td></tr>";
echo "</table>";
echo "</form>";
}
}

// Deleting building 3
if ($_POST['sub1b']){
$bname = $_POST['bname'];
$name = $_POST['name'];
$query = "DELETE FROM building WHERE id = $bname";
$result = pg_query($query);
echo "<p id=editbad>Deleted! <a href=$self>Click here to refresh page</a></p>";
}

echo "<hr>";

///////Updating room 1/////////////////////////
echo "<form action=$self method=POST>";
echo "<p id=edithead>Room - Pick building first</p>";
echo "<table $cell>";
echo "<tr><td $cell><p id=edithead>Name</p></td><td $cell>$step1</td><td $cell colspan=2><input type=submit name=sub2a value=Submit></td></tr>";
echo "</table>";
echo "</form>";

/////////Updating room 2///////////////////////

if ($_POST['sub2a']){

// Setting vars
$bname = $_POST['bname'];

// Room query
$result = pg_query("SELECT id,room_num FROM room WHERE bid = $bname");
$step2 = "<select name=\"room\">";
while ($row = pg_fetch_array($result)){
$step2 .= "<option value=\"".$row['id']."\">".$row['room_num']."</option>\n";
}
$step2 .= "</select>";

// Room table display
echo "<p id=edithead>Pick room</p>";
echo "<form action=$self method=POST>";
echo "<table><tr><td $cell><p id=edithead>Room</p></td><td $cell>$step2</td><td $cell><input type=submit name=sub2b value=Delete></td></tr>";
echo "</table>";
echo "</form>";
}

/////////Updating room 3///////////////////////
if ($_POST['sub2b']){
$rid = $_POST['room'];
$query = "SELECT *, room.id AS rid FROM room INNER JOIN building ON room.bid = building.id WHERE room.id = $rid";
$result = pg_query($query);
while($row = pg_fetch_assoc($result)){
$build = $row['name'];
$room_num = $row['room_num'];
$numcomps = $row['numcomps'];
$ctype = $row['ctype'];
$mtype = $row['mtype'];
echo "<p id=editbad>Are you sure you want to delete this?</p>";
echo "<form action=$self method=POST>";
echo "<table>
<tr><td $cell><p id=edithead>Building</p></td><td $cell><p id=edithead>$build</p><input type=hidden name=rid value=$rid><input type=hidden name=build 
value=$build><input type=hidden name=room_num value=$room_num></td></tr>
<tr><td $cell><p id=edithead>Room #</p></td><td $cell><p id=edithead>$room_num</p></td></tr>
<tr><td $cell><p id=edithead># comps</p></td><td $cell><p id=edithead>$numcomps</p></td></tr>
<tr><td $cell><p id=edithead>Comp type</p></td><td $cell><p id=edithead>$ctype</p></td></tr>
<tr><td $cell><p id=edithead># comps</p></td><td $cell><p id=edithead>$mtype</p></td></tr>
<tr><td $cell><input type=submit name=sub2c value=Yes></td></tr>";
echo "</table></form>";
}
}

/////////Updating room 4///////////////////////
if ($_POST['sub2c']){
$rid = $_POST['rid'];
$room_num = $_POST['room_num'];
$build = $_POST['build'];
$query = "DELETE FROM room WHERE id = $rid";
$result = pg_query($query);
echo "<p id=editbad>Deleted! <a href=$self>Click here to refresh page</a></p>";
}
?>

