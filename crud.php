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
if (isset($_GET['sid'])){
$sid = $_GET['sid'];
$title = $_GET['title'];
$version = $_GET['version'];
echo "<br><span class=\"stit\">Title: </span><span class=\"first\">$title </span><span id=faq>---</span><span class=\"stit\"> Version: 
</span><span class=\"first\">$version</span><hr>";
$query = "SELECT * FROM softroom sr INNER JOIN room r ON (sr.rid = r.id) INNER JOIN building b ON (b.id=r.bid) WHERE sid = $sid";
$result = pg_query($query);
$numrows = pg_num_rows($result);

if ($numrows > 0){
while ($row = pg_fetch_assoc($result)){
$room = $row['room_num'];
$building = $row['name'];
echo "<p $classtext>$building-$room, </p>";
}
}else{
echo "<p $classtext><img src=images/alert.gif> This software is currently not being used.</p>";
}

}


$self = "index.php?page=stats";
echo "<p $classtitle>Statistics</p><hr>";
include 'connect.php';

//espshaner
$query = "SELECT software.id, software.title, software.version, 
software.platform, software.site, software.ltype, software.lnum, SUM(softroom.total) AS total FROM 
software LEFT JOIN softroom ON software.id = softroom.sid 
GROUP BY software.id, software.title, software.version, software.platform, software.site, software.ltype, software.lnum 
ORDER BY software.title";

$result = pg_query($query);
$numrows = pg_num_rows($result);
if ($numrows < 1){
echo "<p id=editbad>No records!</p>";
}else{
echo "<FORM action=$self method=get>";
echo "<table $classtable>";
echo "<tr><td $classnumber>#</td><td $classlong>Title</td>
<td $classtiny>OS</td><td $classtiny>Version</td>
<td $classtiny>License</td><td $classtiny>Bought</td><td $classtiny>Used</td><td $classtiny>Left</td></tr>";
$count = 0;
while ($row = pg_fetch_assoc($result)){
$count++;
$id = $row['id'];
$title = $row['title'];
$uname = $row['uname'];
$version = $row['version'];
$total = $row['total'];
$ltype = $row['ltype'];
$lnum = $row['lnum'];
$total = $row['total'];
$left = $lnum - $total;
$site = $row['site'];
$os = $row['platform'];

if ($left <=0){
$classleft = "class=baddest";
}
elseif ($left <= 5 AND $left >= 1){
$classleft = "class=badder";
}
elseif ($left > 6 AND $left <= 10){
$classleft = "class=bad";
}else{
$classleft = "class=good";
}

if ($lnum == 0){
$left = "UNLIMITED";
$classleft = "class=unlimited";
}

// Changed this so GET doesnt pass a link for results,chng bk to 3 for old
if ((strlen($site) > 300)){
$title = "<a href=$site>$title</a>";
}else{
$title = $row['title'];
}

echo "<tr><td $classnumber>$count</td>
<td $classll><a href=\"".$self."&sid=$id&title=$title&version=$version\">"."$title</a></td>
<td $classlist>$os</td><td $classlist>$version</td><td $classlist>$ltype</td>
<td $classlist>$lnum</td><td $classlist>$total</td><td $classleft>$left</td></tr>";
}
echo "</table></FORM><br>";
}

?>
