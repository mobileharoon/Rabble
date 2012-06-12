<?php
include 'vars.php';

echo "
<p $classtitle>Administrator Login</p>
<hr>
<FORM action=auth.php method=POST>
<table $classchange>
<tr><td $classtd align=left>
User: <br><input type=text size=25 name=uname><br>
Pass: <br><input type=password size=25 name=pass><br>
<input type=submit value=Login id=button>
</td></tr>
</table>
</FORM>
<br>
";
?>
