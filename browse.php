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

include 'connect.php';
include 'vars.php';
$self = "index.php?page=browse";
$query = "SELECT * FROM building";
$result = pg_query($query);
echo "<p $classtitle>Browse</p><hr>";
$build = $row['name'];
while ($row = pg_fetch_assoc($result)){
$build = $row['name'];
$bid = $row['id'];
echo "<img src=images/arrow2.gif> <p class=\"text\"><a href=\"".$self. 
"&build=$build&bid=$bid\">"."$build</a></p><img src=images/spacer.gif>";
}
echo "<br>";

if (isset($_GET['build'])){
$bid = $_GET['bid'];
$query_bname = "SELECT name FROM building WHERE id = $bid";
$result_bname = pg_query($query_bname);
$row_bname = pg_fetch_assoc($result_bname);
$name = $row_bname['name'];
$query = "SELECT *, room.id AS rid FROM room INNER JOIN building ON room.bid = building.id WHERE bid = $bid ORDER by room_num";
$result = pg_query($query);
$rows = pg_num_rows($result);

if ($rows < 1){
echo "<p $classtitle>Results - $name</p><hr>";
echo "<p $classtext>No classrooms have been added to this building!</p>";
}else{
$build = $row['name'];
echo "<p $classtitle>Results - $name</p><hr>";
while ($row = pg_fetch_assoc($result)) {
$room = $row['room_num'];
$rid = $row['rid'];
$build = $row['name'];
$comps = $row['numcomps'];
$mtype = urlencode(stripslashes(htmlspecialchars($row['mtype'])));
$ctype = $row['ctype'];
$ptype = $row['ptype'];

echo "<p $classtext><span>";
echo "<a href=\"".$self. "&rid=$rid&room=$room&building=$build&comps=$comps&mtype=$mtype&ctype=$ctype&ptype=$ptype\">"."$room</a>  ";
echo "</span></p>";
}
}
echo "<br><br>";
}

if (isset($_GET['rid'])){
$rid = $_GET['rid'];
$building = $_GET['building'];
$room = $_GET['room'];
$comps = $_GET['comps'];
$ctype = $_GET['ctype'];
$mtype = $_GET['mtype'];
$ptype = $_GET['ptype'];
include 'connect.php';
$query = "SELECT * FROM softroom 
INNER JOIN room ON softroom.rid = room.id 
INNER JOIN software on softroom.sid = software.id 
WHERE rid = $rid ORDER BY title";
$result = pg_query($query);
$rows = pg_num_rows($result);

if ($rows < 1){
echo "<p $classtitle>Results</p><hr>";
echo "<p id=hsub>No software has been added to this room!</p>";
}else{

echo "<p $classtitle>Results</p><hr>";

if (strlen($ctype) < 4){
$ctype = "----N/A----";
}

/*
if (strlen($mtype) < 4){
$mtype = "----N/A----";
}
*/

if (strlen($ptype) < 5){
$ptype = "----N/A----";
}

echo "<table $classtable>";
echo "<tr><td $classstats>Room</td><td $classstats>Total Computers</td>
<td $classstats>Computer Type</td><td $classstats>Monitor Type</td><td 
$classstats>Printer Type</td><td $classstats>Export</td></tr>";
echo "<tr><td $classlist>$building - $room</td><td $classlist>$comps</td>
<td $classlist>$ctype</td><td $classlist>".addslashes($mtype)."</td><td 
$classlist>$ptype</td><td $classlist>
<a href=csv.php?rid=$rid&building=$building&room=$room>CSV DOWNLOAD</a></td></tr>";
echo "</table><br>";

echo "<table $classtable><tr><td $classnumber>#</td><td $classlong>Software</td><td $classshort>Version</td>
<td $classshort>OS</td><td";
$count = 0;
while ($row = pg_fetch_assoc($result)){
$mtype = $row['mtype'];
$ctype = $row['ctype'];
$ptype = $row['ptype'];
$software = $row['title'];
$version = $row['version'];
$site = $row['site'];
$license = $row['ltype'];
$os = $row['platform'];


if ((strlen($site) > 3)){
$software = "<a href=$site>$software</a>";
}else{
$software = $row['title'];
}

$added = date('M d Y', strtotime($row['added']));
$count++;
echo "<tr><td $classnumber>$count</td><td $classll>$software</td><td $classlist align=center>$version</td><td $classlist>$os</td><td $classlist>$license</td><td $classlist>$added</td></tr>";
}
echo "</table>";
echo "<br>";
$pic = "images/maps/$building$room.gif";
$pic = str_replace(" ","",$pic);
if (file_exists($pic)){
$pic = "<img src=$pic>";
}else{
$pic = "Map N/A";
}
echo "<table $classtable>";
echo "<tr><td $classstats>Map</td></tr>";
echo "<tr><td $classlist>$pic</td></tr>";
echo "</table>";
echo "<br>";
}
}
?>
