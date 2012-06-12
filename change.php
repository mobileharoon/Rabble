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
// Include connection & CSS vars
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
$self = "index.php?page=change";

echo "<p $classtitle>Changing</p><hr>";

// Updating building 1
echo "<p $classhead>Building</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange><tr><td $classtd>Name</td><td $classtd>$step1</td><td $classtd><input type=submit name=sub1a value=Submit></td></tr>";
echo "</table>";
echo "</form>";

// Updating building 2
if ($_POST['sub1a']){
$bname = $_POST['bname'];
$query = "SELECT id,name FROM building WHERE id = $bname";
$result = pg_query($query);
while($row = pg_fetch_assoc($result)){
$name = $row['name'];
echo "<p $classblink>Change</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange><tr><td $classtd>Name</td><td $classtd><input type=text name=changeb 
value=\"$name\"><input type=hidden name=bname value=$bname></td><td $classtd><input type=submit name=sub1b value=Submit></td></tr>";
echo "</table>";
echo "</form>";
}
}

// Updating building 3
if ($_POST['sub1b']){
$name = $_POST['changeb'];
if (empty($name)){
echo "<p id=editbad>Please start over and fill in the box</p>";
}else{
$build = trim($_POST['changeb']);
$query = "UPDATE building SET name = '$build' WHERE id = $bname";
$result = pg_query($query);
echo "<p id=editbad>Updated! <a href=$self>Click here to refresh page</a></p>";
}
}

echo "<hr>";

////////////////////////////////////////////////
///////Updating room licenses/////////////////////////
//////////////////////////////////////////////
echo "<form action=$self method=POST>";
echo "<p $classhead>Room Licenses - Pick building first</p>";
echo "<table $classchange>";
echo "<tr><td $classtd>Name</td><td $classtd>$step1</td><td $classtd><input type=submit name=mit1 value=Submit></td></tr>";
echo "</table>";
echo "</form>";

if ($_POST['mit1']){

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
echo "<p $classblink>Pick room</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange><tr><td $classtd>Room</td><td $classtd>$step2</td><td $classtd><input type=submit name=lit2 value=Submit></td></tr>";
echo "</table>";
echo "</form>";
}

if ($_POST['lit2']){
$rid = $_POST['room'];
$query = "SELECT * FROM softroom INNER JOIN software ON softroom.sid = software.id WHERE rid=$rid";
$result = pg_query($query);
$rows = pg_num_rows($result);

if ($rows < 1){
echo "no records";
}else{
echo "<p $classblink>Update software licenses used</p>";
echo "<FORM action=$self method=post>";
echo "<table $classchange><tr><td $classlong><input type=hidden name=rid value=$rid>Title</td><td $classshort>Version</td><td $classshort>Using</td></tr>";
while ($row = pg_fetch_assoc($result)){
$title = $row['title'];
$sid = $row['sid'];
$version = $row['version'];
$total = $row['total'];
echo "<tr><td $classll>$title</td><td $classlist>$version</td><td $classlist><input type=text name=\"using[$sid]\" value=$total></td></tr>";
}
echo "<tr><td colspan=3 $cell><input type=submit name=lit3 value=Update></td></tr>";
echo "</table></form>";
}
}

if ($_POST['lit3']){
$rid = $_POST['rid'];

if (empty($_POST['using'])){
echo "<p id=editbad>Please start over and fill in all boxes</p>";
}else{
foreach($_POST['using'] as $id => $value){
$query = "UPDATE softroom SET total = '$value' WHERE rid=$rid AND sid=$id";
//echo "<br><br>$query<br><br>";
$result = pg_query($query);
}
echo "<p id=editbad>Updated! <a href=$self>Click here to refresh page</a></p>";
}
}

echo "<hr>";
////////////////////////////////////////////////
///////Updating room software/////////////////////////
//////////////////////////////////////////////
echo "<form action=$self method=POST>";
echo "<p $classhead>Room Software - Pick building first</p>";
echo "<table $classchange><tr><td $classtd>Name</td><td $classtd>$step1</td><td $classtd><input type=submit name=mit11 value=Submit></td></tr>";
echo "</table></form>";

if ($_POST['mit11']){

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
echo "<p $classblink>Pick room</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange><tr><td $classtd>Room</td><td $classtd>$step2</td><td $classtd><input type=submit name=mit2 value=Submit></td></tr>";
echo "</table>";
echo "</form>";
}

if ($_POST['mit2']){
$rid = $_POST['room'];
$query = "SELECT * FROM softroom 
INNER JOIN room ON softroom.rid = room.id 
INNER JOIN software on softroom.sid = software.id 
WHERE rid = $rid ORDER BY title";
$result = pg_query($query);
$rows = pg_num_rows($result);

if ($rows < 1){
echo "no recordS";
}else{
echo "<p $classblink>Select software to remove</p>";
echo "<FORM action=$self method=post>";
echo "<table $classchange><tr><td $classnumber><input type=hidden name=rid value=$rid>Del.</td>
<td $classlong>Title</td><td $classshort>Version</td></tr>";
while ($row = pg_fetch_assoc($result)){
$title = $row['title'];
$sid = $row['sid'];
$version = $row['version'];
echo "<tr><td $classnumber><input type=checkbox name=software[] value=$sid></td>
<td $classll>$title</td><td $classlist>$version</td></tr>";
}
echo "<tr><td colspan=3 $classtd><input type=submit name=mit3 value=Delete></td></tr>";
echo "</table></form>";
}
}

if ($_POST['mit3']){
$softwares = implode(",",$_POST['software']);
$rid = $_POST['rid'];
echo "<p $classblink>Are you sure you want to delete this/these?</p>";
echo "<a name=mit4>";
echo "<form action=$self method=post><input type=hidden name=software value=$softwares><input type=hidden name=rid value=$rid><input type=submit name=mit4 value=Yes></form>";
echo "<META HTTP-EQUIV=Refresh CONTENT=\"0; URL=$self#mit4\">";
}

if ($_POST['mit4']){
$softwares = $_POST['software'];
$rid = $_POST['rid'];
$query = "DELETE FROM softroom WHERE rid = $rid AND sid IN ($softwares)";
$result = pg_query($query);
echo "<p id=editbad>Deleted! <a href=$self>Click here to refresh page</a></p>";
}

echo "<hr>";

////////////////////////////////////////////////
///////Updating room building//////////////////
//////////////////////////////////////////////
echo "<form action=$self method=POST>";
echo "<p $classhead>Room Building - Pick building first</p>";
echo "<table $classchange><tr><td $classtd>Name</td><td $classtd>$step1</td><td $classtd><input type=submit 
name=sub5a value=Submit></td></tr>";
echo "</table>";
echo "</form>";

/////////Updating room-building 2///////////////////////

if ($_POST['sub5a']){

// Setting vars
$bname = $_POST['bname'];

// Room query
$result = pg_query("SELECT id,room_num FROM room WHERE bid = $bname ORDER BY
room_num");
$step2 = "<select name=\"room\">";
while ($row = pg_fetch_array($result)){
$step2 .= "<option value=\"".$row['id']."\">".$row['room_num']."</option>\n";
}
$step2 .= "</select>";

// Room-building table display
echo "<p $classblink>Pick room</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange><tr><td $classtd>Room</td><td $classtd>$step2</td><td $classtd><input type=submit name=sub5b 
value=Submit></td></tr>";
echo "</table>";
echo "</form>";
}

/////////Updating room-build 3///////////////////////
if ($_POST['sub5b']){
$rid = $_POST['room'];
$query = "SELECT * FROM room WHERE id = $rid";
$result = pg_query($query);
while($row = pg_fetch_assoc($result)){
echo "<p $classblink>Change room's building</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange>
<tr><td $classtd>Building</p></td><td $classtd>$step1<input type=hidden name=rid value=$rid></td>
<td $classtd><input type=submit name=sub5c value=Submit></td></tr>";
echo "</table></form>";
}
}

/////////Updating room-build 3///////////////////////
if ($_POST['sub5c']){
$room_num = trim($_POST['room_num']);
$rid = $_POST['rid'];
$bname = $_POST['bname'];
$query = "UPDATE room SET bid = '$bname' WHERE id = $rid";
$result = pg_query($query);
echo "<p id=editbad>Updated! <a href=$self>Click here to refresh page</a></p>";
}

echo "<hr>";

////////////////////////////////////////////////
///////Updating room Info/////////////////////////
//////////////////////////////////////////////
echo "<form action=$self method=POST>";
echo "<p $classhead>Room Info. - Pick building first</p>";
echo "<table $classchange>";
echo "<tr><td $classtd>Name</td><td $classtd>$step1</td><td $classtd><input type=submit name=sub2a value=Submit></td></tr>";
echo "</table></form>";

/////////Updating room 2///////////////////////

if ($_POST['sub2a']){

// Setting vars
$bname = $_POST['bname'];

// Room query
$result = pg_query("SELECT id,room_num FROM room WHERE bid = $bname ORDER BY 
room_num");
$step2 = "<select name=\"room\">";
while ($row = pg_fetch_array($result)){
$step2 .= "<option value=\"".$row['id']."\">".$row['room_num']."</option>\n";
}
$step2 .= "</select>";

// Room table display
echo "<p $classblink>Pick room</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange><tr><td $classtd>Room</td><td $classtd>$step2</td><td $classtd><input type=submit name=sub2b value=Submit></td></tr>";
echo "</table></form>";
}

/////////Updating room 3///////////////////////
if ($_POST['sub2b']){
$rid = $_POST['room'];
$query = "SELECT * FROM room WHERE id = $rid";
$result = pg_query($query);
while($row = pg_fetch_assoc($result)){
$room_num = $row['room_num'];
$numcomps = $row['numcomps'];
$ctype = $row['ctype'];
$mtype = $row['mtype'];
$ptype = $row['ptype'];
echo "<p $classblink>Change</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange>
<tr><td $classshort>Room #</td><td $classtd><input type=text name=room_num 
value=$room_num><input type=hidden name=rid value=$rid></td></tr>
<tr><td $classshort># Computers</td><td $classtd><input type=text name=numcomps value=$numcomps></td></tr>
<tr><td $classshort>Computer Type</td><td $classtd><input type=text name=ctype value=$ctype></td></tr>
<tr><td $classshort>Monitor Type</td><td $classtd><input type=\"text\" name=\"mtype\" value=\"$mtype\"></td></tr>
<tr><td $classshort>Printer Type</td><td $classtd><input type=\"text\" name=\"ptype\" value=\"$ptype\"></td></tr>
<tr><td $classtd align=right colspan=2><input type=submit name=sub2c value=Submit></td></tr>";
echo "</table></form>";
}
}

/////////Updating room 3///////////////////////
if ($_POST['sub2c']){
$room_num = trim($_POST['room_num']);
$rid = $_POST['rid'];
$bname = $_POST['bname'];
$numcomps = trim($_POST['numcomps']);
$ctype = trim($_POST['ctype']);
$mtype = trim($_POST['mtype']);
$ptype = trim($_POST['ptype']);
if (empty($room_num) OR empty($numcomps) OR empty($ctype) OR empty($mtype) OR 
empty($ptype)){
echo "<p id=editbad>Please start over and fill in all boxes</p>";
}else{
$query = "UPDATE room SET room_num ='$room_num' , numcomps ='$numcomps' , ctype = '$ctype' , mtype = '$mtype' 
, ptype = '$ptype' WHERE id = $rid";
$result = pg_query($query);
echo "<p id=editbad>Updated! <a href=$self>Click here to refresh page</a></p>";
}
}

echo "<hr>";

//////////////////////////////////////////////
///////////////////////////////////////////////
// Updating software////////////////////////
////////////////////////////////////////////

// Software query
$result = pg_query("SELECT id , title ||' '|| version AS name  FROM software ORDER BY title");
$step3 = "<select name=\"soft\">";
while ($row = pg_fetch_array($result)){
$step3 .= "<option value=\"".$row['id']."\">".$row['name']."</option>\n";
}

echo "<p $classhead>Software</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange><tr><td $classtd>Name</td><td $classtd>$step3</td><td $classtd><input type=submit name=sub3a value=Submit></td></tr>";
echo "</table></form>";

if ($_POST['sub3a']){
$soft = $_POST['soft'];
$query = "SELECT * FROM software WHERE id = '$soft'";
$result = pg_query($query);
while($row = pg_fetch_assoc($result)){
$title = $row['title'];
$version = $row['version'];
$site = $row['site'];
$ltype = $row['ltype'];
$lnum = $row['lnum'];
echo "<form action=$self method=POST>";
echo "<p $classblink>Change</p>";
echo "<table $classchange>
<tr><td $classshort>Title</td><td $cell><input type=text name=title value=\"$title\"><input type=hidden name=id value=$soft></td></tr>
<tr><td $classshort>Version</td><td $cell><input type=text name=version value=$version></td></tr>
<tr><td $classshort>Website</td><td $cell><input type=text name=site value=$site></td></tr>
<tr><td $classshort>License Type</td><td $cell><input type=text name=ltype value=$ltype></td></tr>
<tr><td $classshort>License #</td><td $cell><input type=text name=lnum value=$lnum></td></tr>
<tr><td $classtd colspan=2 align=right><input type=submit name=sub3b value=Submit></td></tr>
</table></form>";
}
}

if ($_POST['sub3b']){
$id = $_POST['id'];
$title = trim($_POST['title']);
$version = trim($_POST['version']);
$site = trim($_POST['site']);
$lnum = trim($_POST['lnum']);
$ltype = trim($_POST['ltype']);
if (empty($title) || empty($version) || empty($site) || empty($ltype)){
echo "<p id=editbad>Please start over and fill in all boxes</p>";
}else{
$query = "UPDATE software SET title = '$title' , version = '$version' , site = '$site' , ltype = '$ltype' , lnum = '$lnum' WHERE id = $id";
$result = pg_query($query);
echo "<p id=editbad>Updated! <a href=$self>Click here to refresh page</a></p>";

}
}
echo "<br>";
?>
