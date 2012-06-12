--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN1';
SET check_function_bodies = false;

SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 4 (OID 2200)
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


SET SESSION AUTHORIZATION 'hubert';

SET search_path = public, pg_catalog;

--
-- TOC entry 5 (OID 17523)
-- Name: building; Type: TABLE; Schema: public; Owner: hubert
--

CREATE TABLE building (
    id serial NOT NULL,
    name character varying(20)
);


--
-- TOC entry 6 (OID 17543)
-- Name: software; Type: TABLE; Schema: public; Owner: hubert
--

CREATE TABLE software (
    id serial NOT NULL,
    title character varying(40),
    "version" character varying(20),
    site character varying(40)
);


SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 7 (OID 17571)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id serial NOT NULL,
    uname character varying(20),
    pass character varying(20)
);


SET SESSION AUTHORIZATION 'hubert';

--
-- TOC entry 8 (OID 17729)
-- Name: room; Type: TABLE; Schema: public; Owner: hubert
--

CREATE TABLE room (
    id serial NOT NULL,
    room_num character varying(10),
    bid integer,
    numcomps integer,
    ctype character varying(10),
    mtype character varying(10),
    ptype character varying(10)
);


--
-- TOC entry 9 (OID 17739)
-- Name: softroom; Type: TABLE; Schema: public; Owner: hubert
--

CREATE TABLE softroom (
    rid integer NOT NULL,
    sid integer NOT NULL,
    added date
);


--
-- Data for TOC entry 23 (OID 17523)
-- Name: building; Type: TABLE DATA; Schema: public; Owner: hubert
--

COPY building (id, name) FROM stdin;
1	Hickory Ridge
7	ILB
8	Main
\.


--
-- Data for TOC entry 24 (OID 17543)
-- Name: software; Type: TABLE DATA; Schema: public; Owner: hubert
--

COPY software (id, title, "version", site) FROM stdin;
1	Microsoft Office FrontPage (SERVER)	2003	http://www.microsoft.com/
2	Authorware Player	7.0.0.70	http://www.macromedia.com
3	DeepFreeze Enterprise	5	http://www.faronics.com/
4	Derive 5 (SERVER)	5.06	http://www.derive.com
5	DjVu Browser Plug-In	4.5.0.537	http://www.djvu.com/
6	Easy Writer	2.22	n/a
7	Flash Player	7.0.19.0	http://www.macromedia.com
8	Foundations For Success (CD)	1.2	n/a
9	Keyboarding Pro Multimedia	3.0	n/a
12	MS TweakUI PowerToy	2.10.00	http://www.microsoft.com/
13	NetSupport School Pro	7.50	http://www.netsupport-inc.com
14	Netware Client	4.9 sp1	http://www.novell.com/
15	PowerDVD	4.0.13.2621	http://www.cyberlink.com
16	Quicktime for Windows 32-bit	2.1.2.59	http://www.apple.com
17	RealOne Player	10.5	http://www.real.com/
18	Shockwave Player	10.0.0.210	http://www.macromedia.com
19	SkillsAtlas (SERVER)	1.5	http://www.learnscape.com
20	Sun JavaVM	1.4.2_04	http://www.sun.com
21	ToolBook II Runtimes	6.5	http://www.toolbook.com/
22	VirusScan Enterprise	7.10	http://www.mcafee.com/
23	Windows XP Professional	2600 SP1	http://www.microsoft.com
24	Daedalus (SERVER)	5.3.3	http://www.daedalus.com/
25	English Discoveries (SERVER)	1.5	http://www.englishdiscoveries.com/
28	Reading Strategies (SERVER)	6.1W	n/a
29	TOEFL Longman (CD)	2.1	http://www.longman.com/
30	TOEFL Mastery for the CBT (SERVER)	2.0	http://www.eslgold.com
31	Townsend Reading Apps (SERVER)	2.2	n/a
32	Townsend Vocabulary Apps (SERVER)	2.2	n/a
34	Microsoft Visual Studio.NET (SERVER)	2003	http://www.microsoft.com
10	Microsoft Office Pro. (SERVER)	2003	http://www.microsoft.com/
26	Focus on Grammar Adv. (SERVER)	1996	http://www.longman.com/
27	Focus on Grammar Int. (SERVER)	1.1	http://www.longman.com/
33	Focus on Grammar High-Int. (SERVER)	1.1	http://www.longman.com/
\.


SET SESSION AUTHORIZATION 'postgres';

--
-- Data for TOC entry 25 (OID 17571)
-- Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, uname, pass) FROM stdin;
1	demo	demo
\.


SET SESSION AUTHORIZATION 'hubert';

--
-- Data for TOC entry 26 (OID 17729)
-- Name: room; Type: TABLE DATA; Schema: public; Owner: hubert
--

COPY room (id, room_num, bid, numcomps, ctype, mtype, ptype) FROM stdin;
4	110	1	45	n/a	n/a	HP4100
\.


--
-- Data for TOC entry 27 (OID 17739)
-- Name: softroom; Type: TABLE DATA; Schema: public; Owner: hubert
--

COPY softroom (rid, sid, added) FROM stdin;
4	2	2006-03-21
4	24	2006-03-21
4	3	2006-03-21
4	4	2006-03-21
4	5	2006-03-21
4	6	2006-03-21
4	25	2006-03-21
\.


--
-- TOC entry 14 (OID 17528)
-- Name: bindex; Type: INDEX; Schema: public; Owner: hubert
--

CREATE UNIQUE INDEX bindex ON building USING btree (name);


--
-- TOC entry 16 (OID 17548)
-- Name: sindex; Type: INDEX; Schema: public; Owner: hubert
--

CREATE UNIQUE INDEX sindex ON software USING btree (title, "version");


--
-- TOC entry 20 (OID 17738)
-- Name: rindex; Type: INDEX; Schema: public; Owner: hubert
--

CREATE UNIQUE INDEX rindex ON room USING btree (room_num, bid);


--
-- TOC entry 15 (OID 17526)
-- Name: building_pkey; Type: CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY building
    ADD CONSTRAINT building_pkey PRIMARY KEY (id);


--
-- TOC entry 17 (OID 17546)
-- Name: software_pkey; Type: CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY software
    ADD CONSTRAINT software_pkey PRIMARY KEY (id);


SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 18 (OID 17574)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 19 (OID 17576)
-- Name: users_uname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_uname_key UNIQUE (uname);


SET SESSION AUTHORIZATION 'hubert';

--
-- TOC entry 21 (OID 17732)
-- Name: room_pkey; Type: CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);


--
-- TOC entry 22 (OID 17741)
-- Name: softroom_pkey; Type: CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY softroom
    ADD CONSTRAINT softroom_pkey PRIMARY KEY (sid, rid);


--
-- TOC entry 28 (OID 17734)
-- Name: room_ref_build; Type: FK CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY room
    ADD CONSTRAINT room_ref_build FOREIGN KEY (bid) REFERENCES building(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 29 (OID 17743)
-- Name: softroom_ref_room; Type: FK CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY softroom
    ADD CONSTRAINT softroom_ref_room FOREIGN KEY (rid) REFERENCES room(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 30 (OID 17747)
-- Name: softroom_ref_software; Type: FK CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY softroom
    ADD CONSTRAINT softroom_ref_software FOREIGN KEY (sid) REFERENCES software(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 10 (OID 17521)
-- Name: building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hubert
--

SELECT pg_catalog.setval('building_id_seq', 8, true);


--
-- TOC entry 11 (OID 17541)
-- Name: software_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hubert
--

SELECT pg_catalog.setval('software_id_seq', 44, true);


SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 12 (OID 17569)
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 9, true);


SET SESSION AUTHORIZATION 'hubert';

--
-- TOC entry 13 (OID 17727)
-- Name: room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hubert
--

SELECT pg_catalog.setval('room_id_seq', 4, true);


SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 3 (OID 2200)
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


