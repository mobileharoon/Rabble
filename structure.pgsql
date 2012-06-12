CREATE TABLE building (
	id SERIAL PRIMARY KEY, 
	name varchar(20)
);

CREATE UNIQUE INDEX bindex ON building (name);

CREATE TABLE room (
	id SERIAL PRIMARY KEY, 
	room_num varchar(10), 
	bid INT CONSTRAINT room_ref_build REFERENCES building ON DELETE CASCADE ON UPDATE CASCADE, 
	numcomps INT, 
	ctype varchar(10), 
	mtype varchar(10), 
	ptype varchar(10)
);

CREATE UNIQUE INDEX rindex ON room (room_num,bid);

CREATE TABLE software (
	id SERIAL PRIMARY KEY, 
	title varchar(40), 
	version varchar(20), 
	site varchar(40), 
	platform varchar(10), 
	ltype varchar(10), 
	lnum INT
);

CREATE UNIQUE INDEX sindex ON software (title,version,platform);

CREATE TABLE softroom (
	rid INT CONSTRAINT softroom_ref_room REFERENCES room ON DELETE CASCADE ON UPDATE CASCADE, 
	sid INT CONSTRAINT softroom_ref_software REFERENCES software ON DELETE CASCADE ON UPDATE CASCADE, 
	added date, 
	PRIMARY KEY(sid,rid)
);

CREATE TABLE users (
	id SERIAL PRIMARY KEY, 
	uname varchar(20), 
	pass varchar(20)
);

CREATE UNIQUE INDEX uindex ON users(uname);
