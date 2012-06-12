<p class="title">Updates</p>
<hr>
<?php
include 'vars.php';
$date = date("Ymd");
$query = "
SELECT * FROM softroom
INNER JOIN room ON softroom.rid = room.id
INNER JOIN software on softroom.sid = software.id
INNER JOIN building ON building.id = room.bid
ORDER BY added desc limit 15
";
$result = pg_query($query);
echo "<p $classhead>Software - Last 15 added </p>";

echo "<table $classtable><tr><td $classnumber>#</td><td $classlong>Title</td>
<td $classtiny>OS</td><td $classtiny>Version</td>
<td $classtiny>License</td><td $classtiny>Bought</td><td
$classmiddle>Room</td></tr>";

$count = 0;
while ($row = pg_fetch_assoc($result)){
$count++;
$title = $row['title'];
$room_num = $row['room_num'];
$name = $row['name'];
$os = $row['platform'];
$version = $row['version'];
$total = $row['total'];
$ltype = $row['ltype'];
$lnum = $row['lnum'];
$left = $lnum - $total;
$build = $row['name'];

echo "<tr><td $classnumber>$count</td>
<td $classll>$title</td>
<td $classlist>$os</td><td $classlist>$version</td><td $classlist>$ltype</td>
<td $classlist>$lnum</td><td $classlist>$build - $room_num</td></tr>";
}
echo "</table><br>";
?>

