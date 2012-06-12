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
    * Neither the name of Rabble! nor the names of its contributors
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


////////////////////////////////////////////
/////////Get variable//////////////////////

$rid = $_GET['rid'];
$building = $_GET['building'];
$room = $_GET['room'];

$columns = "Software\tVersion\tOS\tLicense\tAdded\n";

///////////////////////////////////////////
//////////Query///////////////////////////

include 'connect.php';
$query = "SELECT * FROM softroom
INNER JOIN room ON softroom.rid = room.id
INNER JOIN software on softroom.sid = software.id
WHERE rid = $rid ORDER BY title";
$result = pg_query($query);
$rows = pg_num_rows($result);

//////////////////////////////////////////
////////Headers//////////////////////////

header("Content-type: application/x-msdownload");
header("Content-Disposition: attachment; filename=extraction.xls");
header("Pragma: no-cache");
header("Expires: 0");
print "$header\n$building\t$room\n\n$columns\n";

//////////////////////////////////////////
/////////Results/////////////////////////

while ($row = pg_fetch_assoc($result)){

$mtype = $row['mtype'];
$ctype = $row['ctype'];
$ptype = $row['ptype'];
$software = $row['title'];
$version = $row['version'];
$site = $row['site'];
$license = $row['ltype'];
$os = $row['platform'];
$added = date('M d Y', strtotime($row['added']));
$data .= $software."\t".$version."\t".$os."\t".$license."\t".$added."\n";
}

print $data;

?>
