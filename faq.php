<p id="header">FAQ</p>
<hr>
<p id="faq">**NOTE: Faq needs to be updated**<br></p>
<p id="faq">How do I contact you?</p>
<p id="hsub">Email me hkhalid at howardcc dot edu</p>
<p id="faq">What are the requirements?</p>
<p id="hsub">Apache, PHP 4+, PostgreSQL 7.4+</p>
<p id="faq">What is the db structure?</p>
<p id="hsub">
CREATE TABLE building (id SERIAL PRIMARY KEY, name varchar(20));
<br><br>
CREATE TABLE room (id SERIAL PRIMARY KEY, room_num varchar(10), bid INT CONSTRAINT room_ref_build REFERENCES building ON DELETE 
CASCADE ON UPDATE CASCADE, numcomps INT, ctype varchar(10), mtype varchar(10));
<br><br>
CREATE TABLE software (id SERIAL PRIMARY KEY, title varchar(20), version varchar(10), site varchar(40));
<br><br>
CREATE TABLE softroom (rid INT CONSTRAINT softroom_ref_room REFERENCES room ON DELETE CASCADE ON UPDATE CASCADE, sid INT 
CONSTRAINT softroom_ref_software REFERENCES software ON DELETE CASCADE ON UPDATE CASCADE, added date, PRIMARY KEY(sid,rid));
</p>
<p id="faq">Why didnt you use mySQL?</p>
<p id="hsub">It has a bad license, people keep buying thier backends, and its not good with foreign keys</p>

<p id="faq">How do I install this?</p>
<p id="hsub">
1. Create a database<br>
2. Unzip rabble.tgz to your web folder<br>
3. Edit connection.php<br>
4. Start adding data via admin section

<p id="faq">What license does Rabble use?</p>
<p id="hsub">BSD License<br><br>


Copyright (c) 2006, Haroon Khalid
All rights reserved.
<br><br>
Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are 
met:<br><br>

    <b>*</b> Redistributions of source code must retain the above copyright 
notice, this list of conditions and the following disclaimer.<br><br>
    <b>*</b> Redistributions in binary form must reproduce the above copyright 
notice, this list of conditions and the following disclaimer in the 
documentation and/or other materials provided with the 
distribution.<br><br>
    <b>*</b> Neither the name of Rabble nor the names of its contributors may be 
used to endorse or promote products derived from this software without 
specific prior written permission.
<br><br>
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS 
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR 
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

</p>
<br><br>
