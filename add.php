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
// Include connect $ CSS vars
include 'connect.php';
include 'vars.php';


$result = pg_query("SELECT * FROM building");
$step1 = "<select name=\"bname\">";
while ($row = pg_fetch_array($result)){
$step1 .= "<option value=\"".$row['id']."\">".$row['name']."</option>\n";
}
$step1 .= "</select>";

echo "<p $classtitle>Adding</p><hr>";

/////////STEP 1///////////////////////
$self = "index.php?page=add";
$cell = "id=edit";
echo "<form action=$self method=POST>";
echo "<p $classhead>Step 1. Pick building</p>";
echo "<table $classchange>";
echo "<tr><td $classtd>Name</td><td $classtd>$step1</td><td $classtd><input type=submit name=sub1a value=Submit></td></tr>";
echo "</table></form>";

/////////STEP 2///////////////////////

if ($_POST['sub1a']){

// Setting vars
$bname = $_POST['bname'];
                
// Room query
$result = pg_query("SELECT id,room_num FROM room WHERE bid = $bname ORDER by room_num");
$step2 = "<select name=\"room\">";
while ($row = pg_fetch_array($result)){
$step2 .= "<option value=\"".$row['id']."\">".$row['room_num']."</option>\n";
}
$step2 .= "</select>";

// Software query
$result = pg_query("SELECT id, software.title||' '||software.version AS name  FROM software ORDER BY title");
$step3 = "<select name=\"soft\">";
while ($row = pg_fetch_array($result)){
$step3 .= "<option value=\"".$row['id']."\">".$row['name']."</option>\n";
}

$sql = "SELECT name FROM building WHERE id = $bname";
$sqlres = pg_query($sql);
$row = pg_fetch_row($sqlres);
$bpick = $row[0];

// Room table display
echo "<p $classblink>Step 2. Pick room - $bpick</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange><tr><td $classtd>Room</td><td $classtd>$step2</td><td $classtd><input type=submit name=sub2 value=Submit></td></tr>";
echo "</table></form>";
}

/////////STEP 3//////////////////////
if ($_POST['sub2']){
$rid = $_POST['room'];
$query = "SELECT * FROM software ORDER BY title";
$result = pg_query($query);
$numrows = pg_num_rows($result);
if ($numrows < 1){
echo "<p id=editbad>No records!</p>";
}else{
echo "<p $classblink>Step 3. Pick software to add to room</p>";
echo "<FORM action=$self method=post>";
echo "<table $classchange>";
echo "<tr><input type=hidden name=rid value=$rid>
<td $classtd>Title</td><td $classtd>Platform</td><td $classtd>Version</td>
<td $classtd>License</td><td $cell>Copies</td><td $classtd>Using</td></tr>";
while ($row = pg_fetch_assoc($result)){
$id = $row['id'];
$title = $row['title'];
$uname = $row['uname'];
$version = $row['version'];
$ltype = $row['ltype'];
$lnum = $row['lnum'];
$platform = $row['platform'];
echo "<tr><td $classlist>$title</td><td $classlist>$platform</td>
<td $classlist>$version</td><td $classlist>$ltype</td><td $classlist>$lnum</td>
<td $classlist><input type=\"text\" name=\"input[$id]\" size=\"5\"></td></tr>";
}
echo "<tr><td colspan=3 $classtd><input type=submit name=sub3></td></tr>";
echo "</table></FORM>";
}
}

if ($_POST['sub3']){
        $rid = $_POST['rid'];
        $date = date("Ymd");
//Code clean up!  help from gsmarlow
foreach($_POST['input'] as $id => $value)
{
        if(!empty($value)){
                $query = "SELECT count(*) FROM softroom WHERE rid=$rid AND sid=$id";
                $result = pg_query($query);   
                if (pg_result($result,0,'count')==0){
                        $query = "INSERT INTO softroom (rid,sid,added,total) VALUES ('$rid','$id','$date','$value')";
                        //echo "<br>$query<br><br>";
                        $result = pg_query($query);
                } else {
                        $query = "UPDATE softroom SET total=$value WHERE rid=$rid AND sid=$id";
                        //echo "<br>$query<br><br>";
                        $result = pg_query($query);
}

}
}
echo "<a name=sub2>";
echo "<p id=editbad>Added! <a href=$self>Click here to refresh page</a></p>";
echo "<META HTTP-EQUIV=Refresh CONTENT=\"0; URL=$self#sub2\">";
}

//////////////////////////////////////////////////////////
// THE OTHERRRRRRRRRRRRRRR STUFFFFFFFFFFFFFFFFFFFFFFFF///
////////////////////////////////////////////////////////
echo "<hr>";
echo "<p id=editbad>Use the section below if an item is not in the drop menus above</p>";
echo "<hr>";

/////ADD BUILDING TABLE//////////////
echo "<p $classhead>Add a building</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange>";
echo "<tr><td $classtd>Name</td><td $classtd><input type=text name=\"badd\"></td><td $classtd><input type=submit name=addb 
value=Add></td></tr>";
echo "</table>";
echo "</form>";

//////CHECK BUILDING//////////
if ($_POST['addb']){
$badd = trim($_POST['badd']);
$bad = pg_escape_string($badd);
if (empty($badd)){
echo "<p id=editbad>Please fill in the box</p>";
}else{
$query = "INSERT INTO building (name) VALUES ('$badd')";
$result = pg_query($query);
echo "<p id=editbad>Added! <a href=$self>Click here to refresh page</a></p>";
}
}

/////ADD ROOM TABLE//////////////
echo "<hr>";
echo "<p $classhead>Add a room</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange>";
echo "<tr><td $classtd>Building</td><td $classtd>$step1</td></tr>";
echo "<tr><td $classtd>Room Number</td><td $classtd><input type=\"text\" name=\"rnum\"></td></tr>";
echo "<tr><td $classtd># of computers</td><td $classtd><input type=\"text\" name=\"rpc\"></td></tr>";
echo "<tr><td $classtd>Printer type</td><td $classtd><input type=\"text\" name=\"rprint\"></td></tr>";
echo "<tr><td $classtd>Monitor type</td><td $classtd><input type=\"text\" name=\"rmon\"></td></tr>";
echo "<tr><td $classtd>Computer type</td><td $classtd><input type=\"text\" name=\"rcomp\"></td></tr>";
echo "<tr><td $classtd colspan=2 align=right><input type=submit name=addr value=Add></td></tr>";
echo "</table>";
echo "</form>";

//////CHECK ROOM//////////
if ($_POST['addr']){
$rnum = trim($_POST['rnum']);
$rnum = pg_escape_string($rnum);
$rpc = trim($_POST['rpc']);
$rpc = pg_escape_string($rpc);
$rprint = trim($_POST['rprint']);
$rprint = pg_escape_string($rprint);
$rmon = trim($_POST['rmon']);
$rmon = pg_escape_string($rmon);
$rcomp = trim($_POST['rcomp']);
$rcomp = pg_escape_string($rcomp);
$bname = $_POST['bname'];

if (empty($rnum) OR empty($rpc) OR empty($rprint) OR empty($rmon) OR empty($rcomp)){
echo "<p id=editbad>Please fill in all boxes</p>";
}else{
$query = "INSERT INTO room (room_num, numcomps, bid, ctype, mtype, ptype) VALUES ('$rnum','$rpc','$bname','$rcomp','$rmon','$rprint')";
$result = pg_query($query);
echo "<p id=editbad>Added! <a href=$self>Click here to refresh page</a></p>";
}
}

echo "<hr>";

//////ADD DEPARTMENT TABLE///////////
echo "<p $classhead>Add a department</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange>";
echo "<tr><td $classtd>Name</td><td $classtd><input type=text name=\"dname\"></td><td $classtd>
<input type=submit name=dept value=Add></td></tr>";
echo "</table>";
echo "</form>";

//////CHECK DEPARTMENT//////////
if ($_POST['dept']){
$dept = trim($_POST['dname']);
if (empty($dept)){
echo "<p id=editbad>Please fill in the box</p>";
}else{
$query = "INSERT INTO department (name) VALUES ('$dept')";
$result = pg_query($query);
echo "<p id=editbad>Added! <a href=$self>Click here to refresh page</a></p>";
}
}

/////ADD SOFTWARE TABLE//////////////
echo "<hr>";
$result = pg_query("SELECT * FROM department ORDER BY name");
$select_option = "<select name=\"dept\">";
while ($row = pg_fetch_array($result)){
$select_option .= "<option value=\"".$row['id']."\">".$row['name']."</option>\n";
}
$select_option .= "</select>";
echo "<p $classhead>Add a software</p>";
echo "<form action=$self method=POST>";
echo "<table $classchange>";
echo "<tr><td $classtd>Title</td><td $classtd><input type=text name=title></td></tr>";
echo "<tr><td $classtd>Version</td><td $classtd><input type=text 
name=version value=n/a></td></tr>";
echo "<tr><td $classtd>Website</td><td $classtd><input type=text 
name=site value=n/a></td></tr>";
echo "<tr><td $classtd>License type</td><td $classtd><input type=text 
name=ltype value=n/a></td></tr>";
echo "<tr><td $classtd># of licenses</td><td $classtd><input type=text 
name=lnum value=0></td></tr>";
echo "<tr><td $classtd>Platform</td><td $classtd><input type=text 
name=platform value=Windows></td></tr>";
echo "<tr><td $classtd>Dept.</td><td $classtd>$select_option</td></tr>";
echo "<tr><td $classtd colspan=2 align=right><input type=submit name=adds value=Add></td></tr>";
echo "</table>";
echo "</form><br>";

//////CHECK SOFTWARE//////////

if ($_POST['adds']){
$title = trim($_POST['title']);
$title = pg_escape_string($title);
$version = trim($_POST['version']);
$version = pg_escape_string($version);
$site = trim($_POST['site']);
$site = pg_escape_string($site);
$ltype = trim($_POST['ltype']);
$ltype = pg_escape_string($ltype);
$lnum = trim($_POST['lnum']);
$lnum = pg_escape_string($lnum);
$platform = trim($_POST['platform']);
$platform = pg_escape_string($platform);
$dept = $_POST['dept'];

if (!isset($title) || !isset($version) || !isset($site) || !isset($ltype) || !isset($lnum) || !isset($platform)){
echo "<p id=editbad>Please fill in all boxes</p>";
}else{
$query = "INSERT INTO software (title,version,site,ltype,lnum,platform,dept) VALUES 
('$title','$version','$site','$ltype','$lnum','$platform','$dept')";
$result = pg_query($query);
echo "<p id=editbad>Added! <a href=$self>Click here to refresh page</a></p>";
}
}
?>
