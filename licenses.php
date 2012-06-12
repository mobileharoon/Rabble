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

$self = "index.php?page=licenses";
include 'connect.php';
include 'vars.php';
echo "<p $classtitle>Licenses</p><hr>";
echo "<p $classhead>Select your department</p>";
$cell = "id=edit";

$query = "SELECT * FROM department ORDER BY name";
$result = pg_query($query);
$numrows = pg_num_rows($result);
$numcols = ceil($numrows/6);
$count = 0;


echo "<table><tr><td valign=top>";

while ($row = pg_fetch_assoc($result)){
$count++;
$dname = $row['name'];
$did = $row['id'];
$name = $row['name'];
echo "<img src=images/arrow2.gif> <p $classtext><a href=\"".$self."&did=$did&name=$name\">"."$dname</a></p><img src=images/spacer.gif><br>";

if ($count > 2){
echo "</td><td valign=top>";
//echo "<img src=images/arrow2.gif> <p id=hsub><a href=\"".$self."&did=$did&name=$name\">"."$dname</a></p><img src=images/spacer.gif><br>";
$count = 0;
}
}

echo "</td></tr></table>";


if (isset($_GET['did'])){
$did = $_GET['did'];
$name = $_GET['name'];

// espshaner help
$query = "SELECT software.id, software.title, software.version, software.site, software.ltype, software.lnum, software.dept, software.platform, SUM(softroom.total) 
AS total FROM software LEFT JOIN softroom ON software.id = softroom.sid WHERE software.dept = $did GROUP BY   
software.id, software.title, software.version, software.site, 
software.ltype, software.lnum, software.dept, software.platform ORDER BY title";

$result = pg_query($query);
$numrows = pg_num_rows($result);

if ($numrows < 1){
echo "<p $classtitle>$name Department</p><hr>";
echo "<img src=images/alert.gif> <p $classtext>This department does not have any software records</p>";
}else{

echo "<hr>";
echo "<p $classtitle>$name Department</p>";
echo "<table $classtable><tr><td $classnumber>#</td><td $classlong>Software</td><td $classtiny>Version</td><td 
$classtiny>OS</td><td $classtiny>License</td><td $classtiny>Bought</td><td $classtiny>Used</td><td $classtiny>Left</td></tr>";
$count = 1;

while ($row = pg_fetch_assoc($result)){
$title = $row['title'];
$version = $row['version'];
$site = $row['site'];
$license = $row['ltype'];
$os = $row['platform'];
$lnum = $row['lnum'];
$added = date('M d Y', strtotime($row['added']));
$total = $row['total'];
$left = $lnum - $total;
$change = "chart";

if ($left <=0){
$change = "baddest";
}
elseif ($left <= 5 AND $left >= 1){
$change = "badder";
}
elseif ($left >= 6 AND $left <= 10){
$change = "bad";
}else{
$change = "good";
}

if ($lnum == 0){
$left = "UNLIMITED";
$change = "unlimited";
}

if ((strlen($site) > 3)){
$title = "<a href=$site>$title</a>";
}else{
$title = $row['title'];
}

echo "<tr><td $classnumber>$count</td><td $classll>$title</td><td $classlist>$version</td><td $classlist>
$os</a></td><td $classlist>$license</td><td $classlist>$lnum</td><td $classlist>$total</td><td class=\"$change\">$left</td></tr>";
$count++;
}

echo "</table><br>";

}
}
?>
