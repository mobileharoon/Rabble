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
GRANT ALL ON SCHEMA public TO hubert WITH GRANT OPTION;
GRANT ALL ON SCHEMA public TO PUBLIC;


SET SESSION AUTHORIZATION 'hubert';

SET search_path = public, pg_catalog;

--
-- TOC entry 5 (OID 17424)
-- Name: building; Type: TABLE; Schema: public; Owner: hubert
--

CREATE TABLE building (
    id serial NOT NULL,
    name character varying(20)
);


--
-- TOC entry 6 (OID 17429)
-- Name: software; Type: TABLE; Schema: public; Owner: hubert
--

CREATE TABLE software (
    id serial NOT NULL,
    title character varying(40),
    "version" character varying(20),
    site character varying(40),
    ltype character varying(20),
    lnum integer,
    platform character varying(10),
    dept integer
);


SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 7 (OID 17434)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id serial NOT NULL,
    uname character varying(20),
    pass character varying(20)
);


SET SESSION AUTHORIZATION 'hubert';

--
-- TOC entry 8 (OID 17439)
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
-- TOC entry 9 (OID 17442)
-- Name: softroom; Type: TABLE; Schema: public; Owner: hubert
--

CREATE TABLE softroom (
    rid integer NOT NULL,
    sid integer NOT NULL,
    added date,
    total integer
);


SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 10 (OID 19355)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE department (
    id serial NOT NULL,
    name character varying
);


SET SESSION AUTHORIZATION 'hubert';

--
-- Data for TOC entry 26 (OID 17424)
-- Name: building; Type: TABLE DATA; Schema: public; Owner: hubert
--

COPY building (id, name) FROM stdin;
1	Hickory Ridge
8	Main
7	ELB
13	HVPA
\.


--
-- Data for TOC entry 27 (OID 17429)
-- Name: software; Type: TABLE DATA; Schema: public; Owner: hubert
--

COPY software (id, title, "version", site, ltype, lnum, platform, dept) FROM stdin;
201	Apple Loops	1.1	n/a	n/a	0	Mac	8
155	Windows 2000 Professional	2195	http://www.mcafee.com	site	0	Windows	6
257	Microsoft Windows Journal Viewer	1.5	http://www.microsoft.com	free	0	Windows	6
316	Windows Media Player	10	n/a	free	0	Windows	6
319	Windows Server 2003	2003	site	site	0	Windows	6
424	Academy of Reading	n/a	n/a	n/a	0	Windows	4
490	Kurzweil	9	n/a	n/a	0	Windows	4
573	Kurzweil	7.07	n/a	n/a	0	Windows	4
310	Kurzweil 3000	9	n/a	n/a	0	Windows	4
105	Plato Pathways	4.2.0.2	http://www.plato.com	n/a	0	Windows	4
104	Plato Plug-in	n/a	http://www.plato.com	n/a	0	Windows	4
437	ALS introductory algebra	5.2	n/a	n/a	0	Windows	7
158	ALS: Introductory Algebra (SERVER)	3.0	n/a	site	0	Windows	7
438	ALS statistics	8.2	n/a	n/a	0	Windows	7
439	Derive4	4	n/a	n/a	0	Windows	7
440	Derive5	5	n/a	n/a	0	Windows	7
151	Interactive Algebra &Trig. (CD)	1.0	n/a	CD	0	Windows	7
443	Math Type	4.0b	n/a	n/a	0	Windows	7
167	MathType 4 (font support)	4	n/a	free	0	Windows	7
444	Minitab	Release 9	n/a	n/a	0	Windows	7
133	MiniTab - Student Edition	Release 9	n/a	n/a	0	Windows	7
137	STATDISK	8.1	n/a	site	0	Windows	7
671	AOL AIM	5	http://www.aim.com	free	0	Windows	6
143	Internet Explorer	6.0 SP2	http://www.microsoft.com	free	0	Windows	6
160	Internet Explorer	5.01 SP2	http://www.microsoft.com	free	0	Windows	6
339	Mozilla Firefox	1	n/a	free	0	Windows	6
352	Mozilla Firefox	1.0.6	n/a	free	0	Windows	6
240	Netscape	7.1	http://browser.netscape.com	free	0	Windows	6
338	Netscape Communicator	7.1	n/a	n/a	0	Windows	6
588	Netscape Navigator	4.73	n/a	n/a	0	Mac	6
242	Acrobat reader	7	http://www.adobe.com	free	0	Windows	6
340	Acrobat Reader w/ Search	7.0.5	n/a	free	0	Windows	6
2	Authorware Player	7.0.0.70	http://www.macromedia.com	BSDL	0	Windows	6
51	Groove	25.0.1748	n/a	n/a	0	Windows	6
183	Media Player	9	http://www.microsoft.com	free	0	Windows	6
52	Media Player	10.0.0.3990	http://www.microsoft.com	free	0	Windows	6
54	Movie Player (32 bit)	2.1.25	http://www.apple.com	free	0	Windows	6
168	MS TweakUI PowerToy	1.33	http://www.microsoft.com	free	0	Windows	6
180	Netware Client	3.21	http://www.novell.com	free	0	Windows	6
493	On screen keyboard	2	n/a	free	0	Windows	6
674	Pharos	7.0.0.2909	n/a	n/a	0	Windows	6
675	Plato Web Learning Network Clients	2.0.0.35	n/a	free	0	Windows	6
673	Microsoft Office XP media content	10	n/a	n/a	0	Windows	6
14	Netware Client	4.9 sp1	http://www.novell.com/	n/a	0	Windows	6
304	Audacity	1.2.3	http://audacity.sourceforge.net/	free	0	Windows	6
145	Authorware Web Player	2004.0.0.73	http://www.macromedia.com/	free	0	Windows	6
128	DjVu Browser Plug-In	5.0.1	http://www.lizardtech.com/	free	0	Windows	6
49	EditPad Lite	5.4.3	http://www.editpadlite.com/	free	0	Windows	6
12	Microsoft Tweak UI	2.10.0.0	http://www.microsoft.com/	free	0	Windows	6
305	DeepFreeze Enterprise	6.0.220.1523	http://www.faronics.com/	site	0	Windows	6
308	Flash Player	9.0.16.0	http://www.adobe.com/	free	0	Windows	6
129	NetSupport School Pro	8.50	http://www.netsupport-inc.com/	SEAT	1154	Windows	6
146	Compel Show	1.0a	n/a	free	0	Windows	6
250	Power DVD	5.1	n/a	DRIVE	0	Windows	6
314	Power DVD	3.0.0.2621	n/a	drive	0	Windows	6
345	Power DVD	5.5.1423	n/a	drive	0	Windows	6
313	Power DVD	5.5	n/a	drive	0	Windows	6
113	Quicktime for Windows	6.5.1	http://www.apple.com	free	0	Windows	6
114	Quicktime for Windows	6.5.2	http://www.apple.com	free	0	Windows	6
115	Quicktime for Windows	7.0.4	http://www.apple.com	free	0	Windows	6
170	Quicktime for Windows	5.0.2	http://www.apple.com	free	0	Windows	6
116	RealOne Player	10.0	http://www.real.com	free	0	Windows	6
117	RealPlayer	10.5	http://www.real.com	free	0	Windows	6
171	RealPlayer Basic	8	http://www.real.com	free	0	Windows	6
118	Scientific Viewer	4	n/a	n/a	0	Windows	6
120	Soundmax	n/a	n/a	n/a	0	Windows	6
123	ToolBook II Runtimes	6.1	n/a	n/a	0	Windows	6
126	VirusScan Enterprise	8.0ipatch11	http://www.mcafee.com	site	0	Windows	6
187	Microsoft Office professional 2003	11	http://www.microsoft.com	site	0	Windows	6
57	Microsoft Office FrontPage (SERVER)	2003 SP1	http://www.microsoft.com	site	0	Windows	6
58	Microsoft Office Professional (SERVER	2003	http://www.microsoft.com	site	0	Windows	6
59	Microsoft Office Professional (SERVER	2003 SP1	http://www.microsoft.com	site	0	Windows	6
156	Microsoft Office Premium (SERVER)	2000 SR1	http://www.microsoft.com	site	0	Windows	6
175	Microsoft Office 2003 (SERVER)	2003 SP1	http://www.microsoft.com	site	0	Windows	6
191	Adobe After effects	6.5	n/a	n/a	0	Windows	8
192	Adobe Audition	1.5	http://www.adobe.com	n/a	0	Windows	8
193	Adobe CS2	n/a	http://www.adobe.com	n/a	0	Mac	8
194	Adobe Encore DVD	1.5	http://www.adobe.com	n/a	0	Windows	8
211	Adobe ImageReady	7.0.1	http://www.adobe.com	n/a	0	Windows	8
273	Adobe In Design CS2	2	n/a	Site	0	Mac	8
196	Adobe Photoshop	10.4	http://www.adobe.com	n/a	0	Windows	8
197	Adobe Photoshop	10.4	http://www.adobe.com	n/a	0	Mac	8
225	Adobe Photoshop CS	8	http://www.adobe.com	n/a	0	Mac	8
62	Adobe Photoshop	7	http://www.adobe.com	n/a	0	Windows	8
200	AutoDesk DWF Viewer	5.1	n/a	n/a	0	Windows	8
202	Apple remote desktop (instructor only)	2.2	n/a	n/a	0	Mac	8
203	Corel Graphics Suite	10	http://www.corel.com	n/a	0	Mac	8
207	Corel Trace	10	http://www.corel.com	n/a	0	Mac	8
275	Corel Photo Paint	10	http://www.corel.com	Site	0	Mac	8
276	Corel R.A.V.E	10	http://www.corel.com	Site	0	Mac	8
208	Lemke Graphic Converter	5.6	n/a	n/a	0	Mac	8
216	Macromedia Director MX	2004	http://www.macromedia.com	n/a	0	Windows	8
218	Macromedia Fireworks	8	http://www.macromedia.com	n/a	0	Windows	8
219	Macromedia Flash	8	http://www.macromedia.com	n/a	0	Windows	8
220	Macromedia Freehand	11	http://www.macromedia.com	n/a	0	Windows	8
223	Macromedia Extension Manager	1.7	http://www.macromedia.com	n/a	0	Windows	8
224	Macromedia Flash 8 Video Encoder	1	http://www.macromedia.com	n/a	0	Windows	8
322	Macromedia MX 2004 Studio	7	n/a	n/a	0	Windows	8
334	Macromedia Extension Manager	1.6.062	n/a	n/a	0	Windows	8
335	Macromedia Fireworks MX 2004	7	n/a	n/a	0	Windows	8
336	Macromedia Freehand MXA	11	n/a	n/a	0	Windows	8
77	Macromedia MX Studio	MX	http://www.macromedia.com	n/a	0	Windows	8
222	Macromedia Contribute	3.11	http://www.macromedia.com	n/a	0	Windows	8
210	Macromedia Director MX	9	http://www.macromedia.com	n/a	0	Mac	8
217	Macromedia Dreamweaver MX	8	http://www.macromedia.com	n/a	0	Windows	8
333	Macromedia Dreamweaver MX	7	n/a	n/a	0	Windows	8
226	Cell Text (CelTx)	9.5	n/a	n/a	0	Mac	8
247	Sorenson Squeeze	3.5	n/a	n/a	0	Windows	6
233	iMovie	6.5	http://www.apple.com	n/a	0	Mac	8
234	Movie Maker	1.2.2541	n/a	free	0	Windows	8
235	Helix Producer	9.0.1.250	n/a	n/a	0	Windows	8
248	Helix Producer Basic	9	n/a	n/a	0	Windows	8
236	Final cut express	3	n/a	n/a	0	Mac	8
237	Final cut PRO	n/a	n/a	n/a	0	Mac	8
221	Shockwave Player	10	http://www.macromedia.com	free	0	Windows	6
315	Shockwave Player	10.0.1.4	n/a	free	0	Windows	6
344	Shockwave	8.5.1	n/a	free	0	Windows	6
253	Toast Titanium	5.2.3	n/a	Site	0	Mac	6
254	HigMat Extension	1.1	n/a	free	0	Windows	6
255	J2SE Runtime Environments	1.5	n/a	free	0	Windows	6
258	TopStyle Lite	3.1	n/a	free	0	Windows	6
260	Automater	1.0.1	n/a	free	0	Mac	6
261	Chess	2.1	n/a	free	0	Mac	6
262	Dashboard	1	n/a	free	0	Mac	6
263	Dictionary	1	n/a	free	0	Mac	6
264	DVD Player	4.6	n/a	free	0	Mac	6
265	Font Book	2.0.1	n/a	free	0	Mac	6
266	Garage Band	2.0.2	n/a	free	0	Mac	6
267	Graphic Converter	5.4.1	n/a	Site	0	Mac	6
280	iChat	3.0.1	n/a	free	0	Mac	6
281	iDVD	5.0.1	n/a	free	0	Mac	6
279	iCal	2.0.2	n/a	free	0	Mac	6
282	Image Capture	3	n/a	free	0	Mac	6
284	Internet Connect	1.4	n/a	free	0	Mac	6
285	iPhoto	5.0.4	n/a	free	0	Mac	6
286	iSync	2.0.1	n/a	free	0	Mac	6
283	iTunes	6.0.1	n/a	free	0	Mac	6
288	Mail	2.03	n/a	free	0	Mac	6
289	Omni Graffle	3.2	n/a	free	0	Mac	6
290	Omni Out Liner	3.1	n/a	free	0	Mac	6
291	Preview	3.1	n/a	free	0	Mac	6
292	Sound Track	1.2	n/a	free	0	Mac	6
293	Stickies	5.1	n/a	free	0	Mac	6
294	System Prefrences	3.1	n/a	free	0	Mac	6
295	Text Edit	3.1	n/a	free	0	Mac	6
270	Acrobat Distiller	7	n/a	Site	0	Mac	6
269	Adobe Briage	1	n/a	Site	0	Mac	6
271	Adobe Creative Suite	2	n/a	Site	0	Mac	6
272	Adobe Help Center	1	n/a	Site	0	Mac	6
296	CPP Testing	5.1	n/a	n/a	0	Windows	23
297	Discover	n/a	n/a	n/a	0	Windows	23
309	Investors Tool Kit	5.0.1	n/a	n/a	0	Windows	6
311	Micrograde	5.0.6	n/a	n/a	0	Windows	6
312	Plato (SERVER)	4.2	n/a	site	0	Windows	6
349	OCLC Passport	n/a	n/a	n/a	0	Windows	25
350	WorkFlows	2002	n/a	n/a	0	Windows	25
351	Fortres	5	n/a	site	0	Windows	25
356	Great Artist	CD	n/a	n/a	0	Windows	8
357	Photography in 1990\\'s	CD	n/a	n/a	0	Windows	8
358	Planet Architecture	CD	n/a	n/a	0	Windows	8
365	Atlas of Atherosclerosis	n/a	n/a	n/a	0	Windows	48
366	Atlas of heart diseases	CD	n/a	n/a	0	Windows	48
367	Basic Radiation Safety	n/a	n/a	n/a	0	Windows	48
368	Cardiac Cather. , angio. & intervention	CD	n/a	n/a	0	Windows	48
369	Congenital Heart Defects	3	n/a	n/a	0	Windows	48
370	Coronary heart disease	CD	n/a	n/a	0	Windows	48
371	Diagnostic Reasoning	CD	n/a	n/a	0	Windows	48
372	Essentials of rythmic recognition	CD	n/a	n/a	0	Windows	48
373	Heart sounds and murmurs	CD	n/a	n/a	0	Windows	48
376	Interactive atlas of human anatomy	CD	n/a	n/a	0	Windows	48
377	Interactive EGG	CD	n/a	n/a	0	Windows	48
378	IV therapy	CD	n/a	n/a	0	Windows	48
379	Meds- Cardiovascular	CD	n/a	n/a	0	Windows	48
380	Meds- Respiratory	CD	n/a	n/a	0	Windows	48
381	Online study guide for cardio. inter.	CD	n/a	n/a	0	Windows	48
382	Procedural skills for cardiac cath team	CD	n/a	n/a	0	Windows	48
384	SimBioSys EGG	n/a	n/a	n/a	0	Windows	48
385	Todds CV review	CD	n/a	n/a	0	Windows	48
560	Todd’s CV Review CD Cardiov.	n/a	n/a	n/a	0	Windows	48
386	Total Heart	CD	n/a	n/a	0	Windows	48
387	Vital Signs	CD	n/a	n/a	0	Windows	48
546	Essentials of Cardiac Rhythm Recog.	n/a	n/a	n/a	0	Windows	48
551	Interactive ECG	n/a	n/a	n/a	0	Windows	48
554	MEDS-Cardiovascular Drug	n/a	n/a	n/a	0	Windows	48
383	Radiographic Anatomy Gallery	CD	n/a	n/a	0	Windows	48
413	TP advanced reading skills	n/a	n/a	n/a	0	Windows	4
414	TP building Reading Skills	n/a	n/a	n/a	0	Windows	4
416	TP improving Reading Skills	n/a	n/a	n/a	0	Windows	4
423	TP vocabulary placement test	n/a	n/a	n/a	0	Windows	4
417	Advanced Word Power	n/a	n/a	n/a	0	Windows	4
418	Advancing vocabulary skills	n/a	n/a	n/a	0	Windows	4
419	Building Vocabulary skills	n/a	n/a	n/a	0	Windows	4
420	Groundwork for better vocabulary	n/a	n/a	n/a	0	Windows	4
421	Improving vocabulary skills	n/a	n/a	n/a	0	Windows	4
435	Critical mass	n/a	n/a	n/a	0	Windows	25
179	Excel Viewer	2000	n/a	free	0	Windows	6
487	Jaws	4.02	n/a	n/a	0	Windows	6
488	Jaws	4.51	n/a	n/a	0	Windows	6
491	SM5 language monitor	0.3	n/a	n/a	0	Windows	6
494	Datatel	n/a	n/a	n/a	0	Windows	6
495	DCT link	2	n/a	n/a	0	Windows	6
564	Lizardtech Djuv Control	4.5	n/a	free	0	Windows	6
563	Broadcom Gigabit Integrated Controller	n/a	n/a	n/a	0	Windows	6
553	Mosby’s Procedural Skills	n/a	n/a	n/a	0	Windows	48
556	New Heart Journal	4th edition	n/a	n/a	0	Windows	48
557	PedHrtmm	n/a	n/a	n/a	0	Windows	48
558	PhysWhiz Cardiac	Spring 2005	n/a	n/a	0	Windows	48
561	The Patient with Myocardial Infarction	n/a	n/a	n/a	0	Windows	48
485	Inspiration	7	n/a	n/a	0	Windows	4
182	Word Viewer	2000	n/a	free	0	Windows	6
184	OSX Tiger	10.4	http://www.apple.com	site	0	Mac	6
181	PowerPoint Viewer	2000	n/a	free	0	Windows	6
300	Novell Client Login	4.9.0	http://www.novell.com	free	0	Windows	6
301	Power Archiver	6.11	n/a	free	0	Windows	6
587	Jupiter Lab	n/a	n/a	n/a	0	Mac	46
575	Macintosh OS	OS 9.0.4	n/a	n/a	0	Mac	6
492	Microsoft intellipoint	4.1	n/a	n/a	0	Windows	6
646	XVID MPEG-4 Video Codec	1.03	n/a	free	0	Windows	6
422	Vocabulary basics	n/a	n/a	n/a	0	Windows	4
446	Geometris Calculus	3	n/a	n/a	0	Windows	7
343	Interact Math Plug-In	4.6	n/a	n/a	0	Windows	7
483	Fortres 101	n/a	n/a	site	0	Windows	25
86	Studio MX	2004	http://www.macromedia.com	n/a	0	Windows	8
252	Djvu	5.0.1	n/a	free	0	Windows	6
574	Zoom Text	8	n/a	n/a	0	Windows	6
249	Live type data	1.2.1	n/a	n/a	0	Mac	6
496	Read and write	1.2	n/a	n/a	0	Windows	6
442	Interactive Calculus	2	n/a	n/a	0	Windows	7
508	Netscape	4.77	n/a	free	0	Windows	6
681	Netscape	8.0.3.3	n/a	free	0	Windows	6
672	MSN Messenger	6.2	n/a	free	0	Windows	6
684	Microsoft Word	n/a	n/a	n/a	0	Mac	6
685	Adobe Golive CS2	2	http://www.adobe.com	site	0	Mac	6
687	Microsoft Front Page 2003 (SERVER)	2003 SP1		site	0	Windows	6
688	McAfee VirusScan Enterprise	8.1i	n/a	site	0	Windows	6
689	Sun JavaVM	1.5.2_04	n/a	free	0	Windows	6
690	Inspiration (SERVER)	7.6	n/a	n/a	0	Windows	4
691	World Languages	n/a	n/a	n/a	0	Windows	6
693	Real Player	10	n/a	n/a	0	Windows	6
694	Windows 98	4.10.1998	n/a	site	0	Windows	6
699	Windows	3.11	n/a	n/a	0	Windows	6
704	Windows Media Player	6.4.07.1121	n/a	free	0	Windows	6
706	Microsoft Off. Pro. w/ FrntPge (SERVER)	n/a	n/a	n/a	0	Windows	6
707	ALS: Introductory Algebra (SERVER)	5.6	n/a	n/a	0	Windows	7
709	Java Run Time Environment	1.4.2_02	n/a	free	0	Windows	6
710	Read and Write	7.2	n/a	n/a	0	Windows	6
712	Sun JavaVM	1.5.0_02	n/a	free	0	Windows	6
714	Internet Explorer	6.0 SP1	n/a	free	0	Windows	6
717	Power DVD	2001	n/a	n/a	0	Windows	6
719	Real Player Basic	7	n/a	free	0	Windows	6
31	Townsend Reading Apps (SERVER)	2.2	n/a	n/a	0	Windows	4
32	Townsend Vocabulary Apps (SERVER)	2.2	n/a	n/a	0	Windows	4
20	Sun JavaVM	1.4.2_04	http://www.sun.com	n/a	0	Windows	6
1	Microsoft Office FrontPage (SERVER)	2003	http://www.microsoft.com/	n/a	0	Windows	6
10	Microsoft Office Pro. (SERVER)	2003	http://www.microsoft.com/	n/a	0	Windows	6
18	Shockwave Player	10.0.0.210	http://www.macromedia.com	n/a	0	Windows	6
144	Adobe Reader	7.0.8	http://www.adobe.com	free	0	Windows	6
8	Foundations For Success - Beyond Words	1.2	http://www.glencoe.com/	CD	0	Windows	21
60	Microsoft Office FrontPage	2003 SP2	http://www.microsoft.com	site	0	Windows	6
61	Microsoft Office Professional	2003 SP2	http://www.microsoft.com	site	0	Windows	6
131	PowerDVD DX	5.1.0708P	http://www.cyberlink.com/	DRIVE	0	Windows	6
244	QuickTime	7.1	http://www.apple.com/quicktime	free	0	Mac	6
16	QuickTime for Windows 32-bit	2.1.2.59	http://www.apple.com/quicktime	free	0	Windows	6
721	QuickTime	7.1	http://www.apple.com/quicktime	free	0	Windows	6
17	RealOne Player	10.5	http://www.real.com/	free	0	Windows	6
119	Shockwave Player	10.1.3r19	http://www.adobe.com/	free	0	Windows	6
19	SkillsAtlas	1.5	http://www.learnscape.com	n/a	0	Windows	21
122	Java Runtime Environment	1.5.0_07	http://www.java.com	free	0	Windows	6
121	Java Runtime Environment	1.4.1_01	http://www.java.com	free	0	Windows	6
21	ToolBook II Runtimes	6.5	http://www.toolbook.com/	free	0	Windows	6
56	Windows XP Professional	2002 SP2	http://www.microsoft.com	site	0	Windows	6
757	GED Official Practice Test	2002	http://www.harcourtachieve.com/	TEST	0	Windows	21
758	ARTStor OIV	2.5	http://www.artstor.org/	site	0	Windows	8
299	VirusScan Enterprise	8.0i patch 13	http://www.mcafee.com/	site	0	Windows	6
759	ePolicy Orchestrator Agent	3.5.0.513	http://www.networkassociates.com/	site	0	Windows	6
761	Cliffs StudyWare for the GED	5.06 Rev. A	n/a	n/a	0	DOS	21
100	Academy of Reading	1.25	http://www.autoskill.com	site	0	Windows	4
762	AttachView for OWA	n/a	http://messageware.com/	site	0	Windows	6
101	AllWrite! 1	1.1	http://www.mhhe.com/	site	0	Windows	4
102	AllWrite! 2	2.0	http://www.mhhe.com/	site	0	Windows	4
26	Focus on Grammar - Advanced	1996	http://www.longman.com/	site	0	Windows	4
33	Focus on Grammar - High Intermediate	1.1	http://www.longman.com/	site	0	Windows	4
27	Focus on Grammar - Intermediate	1.1	http://www.longman.com/	site	0	Windows	4
415	Groundwork for College Reading	2.2	http://www.townsendpress.com/	site	0	Windows	4
764	Townsend Computer Mastery Tests	2.2	http://www.townsendpress.com/	site	0	Windows	4
24	Daedalus	5.3.3	http://www.daedalus.com/	site	0	Windows	4
28	Reading Strategies	6.1W	http://www.harcourtachieve.com/	site	0	Windows	4
139	TI Connect	1.6	http://www.ti.com/	CABLE	0	Windows	7
148	HLS: Introductory Algebra	5.7	http://www.hawkeslearning.com/	site	0	Windows	7
136	Scientific Viewer	5.00	http://www.mackichan.com/	free	0	Windows	6
153	MathType	5.1	http://www.dessci.com/	site	0	Windows	7
4	Derive	5.06	http://www.derive.com/	site	0	Windows	7
766	Derive	6.10	http://www.derive.com/	site	0	Windows	7
441	Interactive Algebra and Trigonometry	1.0	http://www.mcdougallittell.com	CD	0	Windows	7
152	Interactive Calculus	3.0	http://www.mcdougallittell.com/	CD	0	Windows	7
132	MathXL Player	4.1.3.0	http://www.mathxl.com/	free	0	Windows	7
150	InterAct Math Plug-In	5.6.1	http://www.mathxl.com/	free	0	Windows	7
138	TestGen Plug-In	7.3	http://www.mathxl.com/	free	0	Windows	7
355	Exploring ancient cities	CD	n/a	n/a	0	Windows	46
590	Voyager II	2	n/a	n/a	0	Mac	46
428	A house divided	CD	n/a	n/a	0	Windows	46
429	African American History	CD	n/a	n/a	0	Windows	46
430	CD sourcebook of American Hist Machine	CD	n/a	n/a	0	Windows	46
431	Landmark history documents	CD	n/a	n/a	0	Windows	46
432	lest we forget	CD	n/a	n/a	0	Windows	46
433	Medieval realm	CD	n/a	n/a	0	Windows	46
434	Multimedia world history	CD	n/a	n/a	0	Windows	46
470	New England transcendalists	CD	n/a	n/a	0	Windows	46
475	Prism psychology	n/a	n/a	n/a	0	Windows	46
476	Abortion and reproductive rights	CD	n/a	n/a	0	Windows	46
474	Introduction to psychology	CD	n/a	n/a	0	Windows	46
463	Ocean Life 1	CD	n/a	n/a	0	Windows	46
465	Ocean Life 2	CD	n/a	n/a	0	Windows	46
466	Ocean Life 3	CD	n/a	n/a	0	Windows	46
467	Ocean Life 4	CD	n/a	n/a	0	Windows	46
469	Ocean Life 6	n/a	n/a	n/a	0	Windows	46
425	journey through geology	CD	n/a	n/a	0	Windows	46
569	Theory of Plate Techtonics	n/a	n/a	n/a	0	Windows	46
426	Theory of plate tectonics	CD	n/a	n/a	0	Windows	46
63	AutoCAD 2006	Z.54.10	http://www.autodesk.com	n/a	0	Windows	41
64	VIZ Render 2006	3	http://www.renderviz.com/	n/a	0	Windows	41
666	Model Check	n/a	n/a	n/a	0	Windows	41
83	Pro engineer	2002	http://www.ptc.com	n/a	0	Windows	41
361	Fundamentals of Microbiology	n/a	n/a	n/a	0	Windows	41
568	Chem Lab Inorganic	n/a	n/a	n/a	0	Windows	41
586	Interactive Physics II Player	1.0	n/a	n/a	0	Windows	41
566	Logger Pro	2.1.1	n/a	n/a	0	Windows	41
572	Problem Solving for the Sciences	n/a	n/a	n/a	0	Windows	41
354	Dynamic human	2	n/a	n/a	0	Windows	41
374	Int-Phys-Muscular	CD	n/a	n/a	0	Windows	41
375	Int-Phys-Respiratory	CD	n/a	n/a	0	Windows	41
363	Int-Phys-Urinary	CD	n/a	n/a	0	Windows	41
388	Chemistry IV 1	CD	n/a	n/a	0	Windows	41
389	Chemistry IV 2	CD	n/a	n/a	0	Windows	41
390	Saunders Chemistry	CD	n/a	n/a	0	Windows	41
391	Chemistry Interactive	CD	n/a	n/a	0	Windows	41
395	Journal of Chemistry education	1996	n/a	n/a	0	Windows	41
398	Chemistry set	CD	n/a	n/a	0	Windows	41
392	Elements explorer	CD	n/a	n/a	0	Windows	41
394	Interactive Periodic Table	n/a	n/a	n/a	0	Windows	41
396	Organic View	CD	n/a	n/a	0	Windows	41
397	Proton NMR basics	CD	n/a	n/a	0	Windows	41
580	Virtual ChemLab	n/a	n/a	n/a	0	Windows	41
408	Earthscape	CD	n/a	n/a	0	Windows	41
409	Science and environment	CD	n/a	n/a	0	Windows	41
436	Graphical analysis for windows	12/4/1195	n/a	n/a	0	Windows	41
472	IP Player	n/a	n/a	n/a	0	Windows	41
473	Logger	2.1.1	n/a	n/a	0	Windows	41
477	US fire Admin	CD	n/a	n/a	0	Windows	41
479	IJTP	CD	n/a	n/a	0	Windows	41
576	Multimed. Lectures in Biology 101	2002	n/a	site	0	Windows	41
577	BiologyAVI files	avi	n/a	n/a	0	Windows	41
360	Fundamentals of Biology	n/a	n/a	n/a	0	Windows	41
597	Rosetta Stone French (SERVER)	1.5	n/a	n/a	0	Windows	41
598	Rosetta Stone Spanish 1-8 (SERVER)	1.5	n/a	n/a	0	Windows	41
599	Rosetta Stone Spanish 9-19 (SERVER)	2.3.5N	n/a	n/a	0	Windows	41
601	TriplePlayPlus! French (SERVER)	1.5	n/a	n/a	0	Windows	41
602	TriplePlayPlus! Spanish (SERVER)	1.2	n/a	n/a	0	Windows	41
626	CATT 2	2	n/a	site	0	Windows	41
627	Image Composer	1.5	n/a	site	0	Windows	41
628	Convert	4.1	n/a	site	0	Windows	41
629	Perl Package Manager	3.2	n/a	n/a	0	DOS	41
630	Capture  CIS lite Edition	9.2	n/a	site	0	Windows	41
631	Pspice AD lite Eition	9.2	n/a	site	0	Windows	41
632	Pspice Optimizer lite	9.2	n/a	site	0	Windows	41
633	Pspice simulus Editor	9.2	n/a	site	0	Windows	41
634	Orcad Layout	9.2	n/a	site	0	Windows	41
635	Model Editor	9.2	n/a	site	0	Windows	41
636	Simulation Manager	9.2	n/a	site	0	Windows	41
637	Conference  Center	server	n/a	site	0	Windows	41
638	AC Circuit Challenge	5	n/a	CD	0	Windows	41
639	DC Circuit Challenge	5	n/a	site	0	Windows	41
640	OP AMP Ciruit Challenge	2	n/a	site	0	Windows	41
641	Solid State Challenge	1.0F	n/a	site	0	Windows	41
642	Basic Circuits Challenge	5	n/a	site	0	Windows	41
643	Digital Circuit Challenge	4	n/a	site	0	Windows	41
644	Trig Challenge	1	n/a	site	0	Windows	41
645	Power Supply Challenge	3	n/a	site	0	Windows	41
399	Virtual Chem Lab	1	n/a	n/a	0	Windows	41
393	Interactive journey through physics	CD	n/a	n/a	0	Windows	41
565	Interactive Physics Player	n/a	n/a	n/a	0	Windows	41
578	History of DNA photographs	ppt	n/a	n/a	0	Windows	41
616	Pro engineer	2	n/a	n/a	0	Windows	41
743	Finale 2007	r1	n/a	site	0	Windows	41
747	PCRE	n/a	n/a	n/a	0	Linux	41
748	Snort	n/a	n/a	n/a	0	Linux	41
6	Easy Writer	2.22	http://www.softwareforstudents.com/	n/a	0	Windows	41
25	English Discoveries	1.5	http://www.englishdiscoveries.com/	SEAT	0	Windows	41
607	Longman English Interactive 3	1/e	http://www.pearsonlongmansupport.com/	CONNECTION	0	Windows	41
610	Writer's Resources	2.0	http://www.wadsworth.com/	n/a	0	Windows	41
570	Fv	n/a	n/a	n/a	0	Windows	48
571	Hera	n/a	n/a	n/a	0	Windows	48
581	Problem Solving Skills for the Sciences	n/a	n/a	n/a	0	Windows	48
427	Diet Analysis plus	3	n/a	n/a	0	Windows	48
454	Assess Test for RN	CD	n/a	n/a	0	Windows	48
455	Cardiovascular Anatomy and Physiology	CD	n/a	n/a	0	Windows	48
456	Clinical Delegation	CD	n/a	n/a	0	Windows	48
458	Maternity nursing	CD	n/a	n/a	0	Windows	48
459	Medical surgical nursing	CD	n/a	n/a	0	Windows	48
460	NCLEX- RN review	CD	n/a	n/a	0	Windows	48
461	Pathology Atlas	CD	n/a	n/a	0	Windows	48
462	Womens health 3	CD	n/a	n/a	0	Windows	48
478	Therapeutic comm series	CD	n/a	n/a	0	Windows	48
509	Accunet Workstation	n/a	n/a	n/a	0	Windows	48
510	Arterial Blood Gases I	n/a	n/a	n/a	0	Windows	48
511	Chest Tubes & Drainage Systems	n/a	n/a	n/a	0	Windows	48
512	Conflict Resolution	n/a	n/a	n/a	0	Windows	48
513	Documenting Care: The Charting Process	n/a	n/a	n/a	0	Windows	48
514	Domestic Violence	n/a	n/a	n/a	0	Windows	48
515	Establishing Rapport and Trust	n/a	n/a	n/a	0	Windows	48
516	Harbor Hospital	n/a	n/a	n/a	0	Windows	48
517	HESI TEST	n/a	n/a	n/a	0	Windows	48
518	Infection Prevention	n/a	n/a	n/a	0	Windows	48
520	Maternity Nursing I	n/a	n/a	n/a	0	Windows	48
521	Medical Surgical I	n/a	n/a	n/a	0	Windows	48
522	Medical Surgical II	n/a	n/a	n/a	0	Windows	48
523	Medication Administration	n/a	n/a	n/a	0	Windows	48
524	Mental Health Nursing II	n/a	n/a	n/a	0	Windows	48
525	Mental Health Nursing III	n/a	n/a	n/a	0	Windows	48
526	Mosby’s Fluids and Electrolytes	n/a	n/a	n/a	0	Windows	48
527	Nasogastric Intubation & Nutrition	n/a	n/a	n/a	0	Windows	48
528	Nursing Assessment of the New Family	n/a	n/a	n/a	0	Windows	48
529	Nursing Process & Critical Thinking	n/a	n/a	n/a	0	Windows	48
530	PreOP Care	n/a	n/a	n/a	0	Windows	48
531	PostOP Care	n/a	n/a	n/a	0	Windows	48
532	Physical Assessment Findings	n/a	n/a	n/a	0	Windows	48
533	Physical Assessment of a Child	n/a	n/a	n/a	0	Windows	48
534	The Helping Interview - Therapeutic Comm	n/a	n/a	n/a	0	Windows	48
536	AACN Clinical Sim. for CCS II	n/a	n/a	n/a	0	Windows	48
537	Abram’s Angiography	n/a	n/a	CD	0	Windows	48
538	AVIR Online Study Guide	Final Candidate 9	n/a	Website	0	Windows	48
539	AVIR Periph. Vasc. Disease	n/a	n/a	n/a	0	Windows	48
540	CathSap II	1.1	n/a	n/a	0	Windows	48
541	Criley Heart Sound & Murmers	n/a	n/a	n/a	0	Windows	48
542	Critical Thinking I & II	n/a	n/a	n/a	0	Windows	48
543	CV Orientation II	2004-2006	n/a	n/a	0	Windows	48
544	Delmar Heart & Lung Sounds	Spring 2005	n/a	n/a	0	Windows	48
457	EKG Basic rhythm analysis	CD	n/a	n/a	0	Windows	48
547	Grossman’s Cardiac Cathetization	n/a	n/a	n/a	0	Windows	48
548	HeartSlides II	2	n/a	n/a	0	Windows	48
549	Hemodynamics Simulator	2002	n/a	n/a	0	Windows	48
552	Interventional Radiology	n/a	n/a	n/a	0	Windows	48
362	Int-Phys-Nervous	CD	n/a	n/a	0	Windows	48
562	Case Studies	n/a	n/a	n/a	0	Windows	48
697	IV Therapy: B.T.A.C	n/a	n/a	n/a	0	Windows	48
65	1st Page 2000	2	http://www.evrsoft.com	free	0	Windows	47
67	ActiveWorlds	3.4	http://www.activeworlds.com	free	0	Windows	47
69	CA3D	4.1	www.ca3d-engine.de	n/a	0	Windows	47
70	DAMBE	1	http://www.dambe.org	n/a	0	Windows	47
73	Forte for Java	4 CE	http://www.sun.com	free	0	Windows	47
74	Java 2 SDK	1.4.1_02	http://www.sun.com	free	0	Windows	47
75	Java Web start	1.2	http://java.sun.com	n/a	0	Windows	47
243	Java Web Start	1.0.1	n/a	n/a	0	Windows	47
251	Java (update 2)	5	n/a	n/a	0	Windows	47
401	Forte for Java	4.0CE	n/a	n/a	0	Windows	47
405	Java Run Time Environment	1.4.2	n/a	n/a	0	Windows	47
406	Java Run Time Environment	1.4.1	n/a	n/a	0	Windows	47
76	Learning Plus (SERVER)	3.1	n/a	n/a	0	Windows	47
157	Microsoft Vis Studio Ent. (SERVER)	6.0 SP5	http://www.microsoft.com	site	0	Windows	47
81	MSDN lib for VS .NET2003	2003	http://www.microsoft.com	n/a	0	Windows	47
84	SAM XP (SERVER)	6	n/a	n/a	0	Windows	47
324	SAM XP (SERVER)	website	n/a	site	0	Windows	47
85	SAM XP (SERVER)	1.3	n/a	n/a	0	Windows	47
87	Dreamweaver MX 2004	7.0.1	http://www.macromedia.com	n/a	0	Windows	47
88	Extension Manager	1.6.062	http://www.macromedia.com	n/a	0	Windows	47
90	Fireworks MX	7.0.2.695	http://www.macromedia.com	n/a	0	Windows	47
91	Flash MX	7.0.1	http://www.macromedia.com	n/a	0	Windows	47
92	Freehand MX	11.0.2.95	http://www.macromedia.com	n/a	0	Windows	47
95	XML SPY	2006 sp2	http://www.adobe.com	n/a	0	Windows	47
96	SmallBASIC	0.7.0.15	http://smallbasic.sourceforge.net	free	0	Windows	47
98	Ebay Turbo Lister	3.5.1.0	n/a	free	0	Windows	47
99	Quickbooks	2004	http://www.quickbooks.com	n/a	0	Windows	47
484	Gregg College Keyboarding	1	n/a	n/a	0	Windows	47
669	Gregg College Keyboarding	10.0.0.63	n/a	site	0	Windows	47
670	Data Entry	n/a	n/a	n/a	0	Windows	47
323	MS-DOS QBasic	1.1	n/a	site	0	DOS	47
325	Altova XML SPY HOME EDITION 2006	2006	n/a	free	0	Windows	47
326	Evrsoft	2	n/a	n/a	0	Windows	47
327	Macromedia Cold Fusion	n/a	n/a	website	0	Windows	47
330	MySQL Server	4.1	n/a	n/a	0	Windows	47
331	NCBI	4.1	n/a	n/a	0	Windows	47
332	PHP Designer 2005	2005	n/a	n/a	0	Windows	47
400	Network Plus	n/a	n/a	n/a	0	Windows	47
71	ExamView Player	4.06	http://www.fscreations.com	free	0	Windows	47
320	ExamView Pro	4.06	n/a	site	0	Windows	47
346	Typing Tutor	n/a	n/a	free	0	Windows	47
703	ExamView Pro	4.0	n/a	site	0	Windows	47
723	CainAbel	2.9	http://www.oxid.it/cain.html	Free	0	Windows	47
724	Ethereal	.99	http://www.ethereal.com/	Free	0	Windows	47
725	IDScenter	1.1	http://www.engagesecurity.com/	n/a	0	Windows	47
726	Legion	n/a	n/a	n/a	0	Windows	47
727	Metasploit	2.6	http://www.metasploit.com	n/a	0	Windows	47
728	MS Baseline Security Analyzer	2.0	n/a	n/a	0	Windows	47
729	Net Brute Scanner Security Suite	n/a	n/a	n/a	0	Windows	47
730	OSSEC Hids Agent	n/a	http://www.ossec.net/	n/a	0	Windows	47
731	Sam Spade	1.14	n/a	n/a	0	Windows	47
734	Vidalia	.07	n/a	n/a	0	Windows	47
736	WinPcap	3.1	n/a	n/a	0	Windows	47
737	Wire Shack	.99.2	n/a	n/a	0	Windows	47
738	Nmap	n/a	n/a	n/a	0	Linux	47
739	Nessus	n/a	n/a	n/a	0	Linux	47
740	Sam Spade	n/a	n/a	n/a	0	Linux	47
741	John The Ripper	n/a	n/a	n/a	0	Linux	47
742	Netcat	n/a	n/a	n/a	0	Linux	47
746	Apache	2	n/a	n/a	0	Linux	47
34	Microsoft Visual Studio.NET Pro	2005	http://www.microsoft.com	n/a	0	Windows	47
753	Bruce\\'s Unusual Typing Wizard	1.4.0	http://typing.qcalculus.com/	free	0	Windows	47
141	Bruce\\'s Typing Tutor	4.2.0	http://typing.qcalculus.com/	free	0	Windows	47
142	Keyboarding Pro 4	4.0.1	http://www.thomsonedu.com/	site	0	Windows	47
763	Visual Studio.NET	2003	http://www.microsoft.com/	site	0	Windows	47
600	Smart Start Italian (SERVER)	n/a	n/a	n/a	0	Windows	4
593	Oaxaca (CD)	n/a	n/a	CD	0	Windows	4
591	CLS - Korean (CD)	n/a	n/a	CD	0	Windows	4
448	Enjoyment of music 1	CD	n/a	n/a	0	Windows	8
449	Enjoyment of music 2	n/a	n/a	n/a	0	Windows	8
450	Enjoyment of music 3	n/a	n/a	n/a	0	Windows	8
451	Enjoyment of music 4	n/a	n/a	n/a	0	Windows	8
452	Music 101N exams	CD	n/a	n/a	0	Windows	8
453	Music Therapy	pdf	n/a	n/a	0	Windows	8
502	Music Lab (SERVER)	3.1	n/a	n/a	0	Windows	8
504	Enjoyment of Music 1-4	n/a	n/a	CD	0	Windows	8
501	Cubase VST Score	3.7	n/a	Dongle	0	Windows	8
621	Finale	2003	n/a	free	0	Windows	8
503	MIDI Xplained	3.01	n/a	n/a	0	Windows	8
618	Going to a classroom concert	pdf	n/a	n/a	0	Windows	8
620	Norton enjoyment of music	6th edition	n/a	n/a	0	Windows	8
622	Listening Guide Player	6th edition	n/a	free	0	Windows	8
722	3D Studios	8	http://www.discreet.com	Floating	20	Windows	8
744	Finale 2007	r1	n/a	Site	30	Win/MAC	8
745	Practica Musica	5.013	n/a	Site	30	Win/MAC	8
107	Francias	n/a	n/a	n/a	0	Windows	4
592	Français	n/a	n/a	site	0	Windows	4
108	Prego	n/a	n/a	n/a	0	Windows	4
594	Prego! (SERVER)	n/a	n/a	n/a	0	Windows	4
111	Puntos	n/a	n/a	n/a	0	Windows	4
110	Puntos Ch10-18	n/a	n/a	n/a	0	Windows	4
109	Puntos Ch1-9	n/a	n/a	n/a	0	Windows	4
596	Puntos Language Tutor	1.0	n/a	site	0	DOS	4
112	Vis-à-vis	n/a	n/a	n/a	0	Windows	4
604	Vis-à-vis Language Tutor	1.0	n/a	n/a	0	Windows	4
603	Vis-à-vis (SERVER)	n/a	n/a	n/a	0	Windows	4
595	Puntos de Partida (SERVER)	1.0	n/a	n/a	0	Windows	4
715	Writers Discoveries (SERVER)	2	n/a	n/a	0	Windows	4
760	Grammar Fitness	7.5	http://www.meritsoftware.com/	site	10	Windows	4
756	Grammar Express Basic	1/e	http://www.pearsonlongmansupport.com/	CONNECTION	0	Windows	4
754	Longman English Interactive 2	1/e	http://www.pearsonlongmansupport.com/	CONNECTION	0	Windows	4
755	Longman English Interactive 4	1/e	http://www.pearsonlongmansupport.com/	CONNECTION	0	Windows	4
765	TOEFL Longman iBT	n/a	http://www.longmanusa.com/toefl	CD	0	Windows	4
364	12 Lead ECG	CD	n/a	n/a	0	Windows	48
767	Privoxy	3.0.3	n/a	n/a	0	Windows	47
768	Vmware Server	n/a	n/a	n/a	0	Windows	47
769	MINITAB	14.20	http://www.minitab.com/	n/a	0	Windows	7
649	Intelligent Tutor - Algebra II	1994	http://www.mathtutor.com/	site	0	DOS	7
648	Intelligent Tutor - Algebra I	1994	http://www.mathtutor.com/	site	0	DOS	7
650	Intelligent Tutor - Geometry	1994	http://www.mathtutor.com/	site	0	DOS	7
653	Intelligent Tutor - Intro. Calculus	1994	http://www.mathtutor.com/	site	0	DOS	7
651	Intelligent Tutor - Pre-Algebra	1994	http://www.mathtutor.com/	site	0	DOS	7
652	Intelligent Tutor - Trigonometry	1994	http://www.mathtutor.com/	site	0	DOS	7
135	PC Logo	2.0a	http://www.terrapinlogo.com/	n/a	0	Windows	7
647	Geometer\\'s Sketchpad	4.05	http://www.keypress.com/	SEAT	0	Windows	7
140	TI InterActive!	1.3	http://www.ti.com/	SEAT	0	Windows	7
134	ModuMath	2.6a	http://www.modumath.org/	SEAT	0	Windows	7
657	Accelerated English	2.0	http://www.usecpi.com/	n/a	0	Windows	41
106	CAN-8	n/a	http://www.can8.com	CONNECTION	0	Windows	4
605	Connected Speech	1.1	http://www.encomium.com/	n/a	0	Windows	41
654	Longman Interactive American Dictionary	1.0	http://www.longman.com/	n/a	0	Windows	41
303	Pronunciation Power	1996	http://www.encomium.com/	n/a	0	Windows	41
660	Rosetta Stone - English	2.3.5N	http://www.rosettastone.com/	n/a	0	Windows	41
658	Traci Talk - The Mystery	1.0	http://www.usecpi.com/	n/a	0	Windows	41
659	TriplePlayPlus! - English	1.2	http://www.syrlang.com/	n/a	0	Windows	41
655	Quicktime for Windows 16-bit	2.1.2.59	http://www.apple.com/quicktime	free	0	Windows	6
770	Medical Terminology - A Short Course	4/e	http://www.us.elsevierhealth.com/	CD	0	Windows	48
771	All-Star ESL 1	1/e	http://www.mhhe.com/	site	0	Windows	4
772	All-Star ESL 2	1/e	http://www.mhhe.com/	site	0	Windows	4
773	Creative WebCam Center	1.02.01	http://www.creative.com/	CAMERA	0	Windows	6
774	Micrograde	5.05H	http://www.chariot.com/	n/a	0	Windows	6
656	Super Success for TOEFL	n/a	http://www.encomium.com/	CD	0	Windows	41
30	TOEFL Mastery for the CBT	2.0	http://www.thomson.com/	CONNECTION	24	Windows	41
609	TOEFL Mentor	n/a	http://www.encomium.com/	n/a	0	Windows	41
\.


SET SESSION AUTHORIZATION 'postgres';

--
-- Data for TOC entry 28 (OID 17434)
-- Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, uname, pass) FROM stdin;
1	admin	cartman
\.


SET SESSION AUTHORIZATION 'hubert';

--
-- Data for TOC entry 29 (OID 17439)
-- Name: room; Type: TABLE DATA; Schema: public; Owner: hubert
--

COPY room (id, room_num, bid, numcomps, ctype, mtype, ptype) FROM stdin;
9	230	1	29	GX280	17inch CRT	HP4100
13	320	1	27	GX270	17inch CRT	HP4100
14	322	1	31	GX270	17inch CRT	HP4100
15	324	1	19	GX270	17inch CRT	HP4100
16	326	1	57	GX270	17inch CRT	HP4100
17	328	1	25	GX270	17inch CRT	HP4100
18	373	1	2	GX110/280	n/a	HP4100
19	376	1	2	GX110/280	n/a	HP4100
20	334	1	25	GX280	17inch LCD	HP4100
21	332	1	23	GX280	17inch LCD	HP4100
26	220	1	1	GX280	17inch CRT	NO PRINTER
27	224	1	1	GX280	17inch CRT	NO PRINTER
28	240	1	1	GX270	17inch CRT	NO PRINTER
29	244	1	1	GX270	17inch CRT	NO PRINTER
30	246	1	1	GX270	17inch CRT	NO PRINTER
31	248	1	1	GX270	17inch CRT	NO PRINTER
32	250	1	1	GX270	17inch CRT	NO PRINTER
33	254	1	26	GX280	17inch LCD	HP4100
39	310	7	33	n/a	n/a	n/a
40	L180	8	36	n/a	n/a	n/a
41	222	7	25	n/a	n/a	n/a
43	L130	8	2	n/a	n/a	n/a
44	N104	8	17	n/a	n/a	n/a
45	N106	8	18	n/a	n/a	n/a
47	L140	8	7	n/a	n/a	n/a
48	302	7	26	n/a	n/a	n/a
49	304	7	26	n/a	n/a	n/a
50	306	7	26	n/a	n/a	n/a
51	318	7	25	n/a	n/a	n/a
52	319	7	26	n/a	n/a	n/a
53	320	7	25	n/a	n/a	n/a
54	321	7	25	n/a	n/a	n/a
56	322	7	25	n/a	n/a	n/a
57	323	7	25	n/a	n/a	n/a
60	118	7	25	n/a	n/a	n/a
61	119	7	25	n/a	n/a	n/a
62	120	7	25	n/a	n/a	n/a
63	121	7	25	n/a	n/a	n/a
65	123	7	25	n/a	n/a	n/a
66	205	7	25	n/a	n/a	n/a
67	225	7	25	n/a	n/a	n/a
69	224	7	25	n/a	n/a	n/a
74	210	7	25	n/a	n/a	n/a
76	203	7	25	n/a	n/a	n/a
77	201	7	25	n/a	n/a	n/a
78	122	7	25	n/a	n/a	n/a
79	223	7	26	n/a	n/a	n/a
82	Kiosk	8	17	n/a	n/a	n/a
83	L230	8	10	n/a	n/a	n/a
84	L240	8	4	n/a	n/a	n/a
85	A040	8	17	n/a	n/a	n/a
87	N228	8	33	n/a	n/a	n/a
88	N212	8	1	n/a	n/a	n/a
89	N208	8	2	n/a	n/a	n/a
90	L160	8	25	n/a	n/a	n/a
91	301	7	50	n/a	n/a	n/a
92	303	7	12	n/a	n/a	n/a
93	N200	8	4	n/a	n/a	n/a
94	ST105	8	13	n/a	n/a	n/a
95	ST106	8	9	n/a	n/a	n/a
96	ST206	8	11	n/a	n/a	n/a
97	ST204	8	7	n/a	n/a	n/a
98	ST207	8	7	n/a	n/a	n/a
100	ST222	8	10	n/a	n/a	n/a
99	ST208	8	7	n/a	n/a	n/a
103	117	7	1	n/a	n/a	n/a
104	208	7	1	n/a	n/a	n/a
105	209	7	1	n/a	n/a	n/a
109	316	8	1	n/a	n/a	n/a
110	317	8	1	n/a	n/a	n/a
111	207	7	2	n/a	n/a	n/a
112	218	7	1	n/a	n/a	n/a
113	219	7	1	n/a	n/a	n/a
114	220	7	2	n/a	n/a	n/a
115	221	7	1	n/a	n/a	n/a
116	L150	8	1	n/a	n/a	n/a
117	L52	8	1	n/a	n/a	n/a
118	L158	8	1	n/a	n/a	n/a
119	L164	8	1	n/a	n/a	n/a
120	L168	8	1	n/a	n/a	n/a
121	N105	8	1	n/a	n/a	n/a
125	SA250	8	1	n/a	n/a	n/a
126	TA1	8	1	n/a	n/a	n/a
122	N115	8	1	n/a	n/a	n/a
124	N236	8	1	n/a	n/a	n/a
123	N220	8	1	n/a	n/a	n/a
128	N114	8	1	n/a	n/a	n/a
129	TA3	8	1	n/a	n/a	n/a
131	L214	8	25	n/a	n/a	n/a
133	L20E	8	10	n/a	n/a	n/a
134	L-W	8	3	n/a	n/a	n/a
135	L-RF	8	2	n/a	n/a	n/a
136	L242-02	8	1	n/a	n/a	n/a
127	N103	8	1	GX270	17inch LCD	NO PRINTER
80	Circ. Desk	8	3	n/a	n/a	n/a
101	108	8	1	n/a	n/a	n/a
34	110	7	61	GX260	17inch LCD	HP9050DN
102	116	7	1	GX260	17inch LCD	NO PRINTER
148	160	13	21	G5	Apple 20	n/a
149	215	13	21	G5	Apple 20	Zerox
146	245	13	1	GX620	17inch LCD	n/a
145	235	13	1	GX620	17inch LCD	n/a
140	140	13	1	GX620	17inch LCD	none
141	145	13	1	GX620	17inch LCD	n/a
142	150	13	1	GX620	17inch LCD	n/a
143	155	13	1	GX620	17inch LCD	n/a
144	225	13	1	GX620	17inch LCD	n/a
147	152	8	1	GX270	17inch LCD	n/a
139	204	7	26	GX260	17inch LCD	HP4600
11	110	1	13	GX260	15inch FP	LJ4100
12	112	1	16	GX280	17inch FP	LJ4100
158	232	1	28	GX280	n/a	LJ4100
150	102	1	1	GX280	n/a	n/a
151	106	1	1	GX280	n/a	n/a
22	108	1	1	GX280	17inch FP	n/a
23	120	1	1	GX280	17inch FP	n/a
152	130	1	1	GX280	n/a	n/a
153	134	1	1	GX280	n/a	n/a
24	136	1	1	GX280	17inch FP	n/a
25	154	1	1	GX280	17inch FP	n/a
154	158	1	1	GX280	n/a	n/a
155	222	1	25	GX280	n/a	LJ4100
156	226	1	28	GX280	n/a	LJ4100
157	228	1	24	GX280	n/a	LJ4100
159	242	1	27	GX280	n/a	LJ4100
\.


--
-- Data for TOC entry 30 (OID 17442)
-- Name: softroom; Type: TABLE DATA; Schema: public; Owner: hubert
--

COPY softroom (rid, sid, added, total) FROM stdin;
9	100	2006-05-22	33
9	144	2006-05-22	33
9	101	2006-05-22	33
9	102	2006-05-22	33
9	145	2006-05-22	33
9	141	2006-05-22	33
9	146	2006-05-22	33
9	24	2006-05-22	33
9	128	2006-05-22	33
9	49	2006-05-22	33
9	26	2006-05-22	33
9	33	2006-05-22	33
9	27	2006-05-22	33
9	148	2006-05-22	33
9	152	2006-05-22	33
9	150	2006-05-22	33
9	143	2006-05-22	33
9	142	2006-05-22	33
9	153	2006-05-22	33
9	132	2006-05-22	33
9	12	2006-05-22	33
9	129	2006-05-22	33
9	135	2006-05-22	33
9	131	2006-05-22	33
9	16	2006-05-22	33
9	28	2006-05-22	33
9	117	2006-05-22	33
9	136	2006-05-22	33
9	122	2006-05-22	33
9	138	2006-05-22	33
9	139	2006-05-22	33
9	21	2006-05-22	33
9	56	2006-05-22	33
9	4	2006-05-22	33
9	649	2006-05-22	33
9	648	2006-05-22	33
9	650	2006-05-22	33
9	651	2006-05-22	33
9	652	2006-05-22	33
9	653	2006-05-22	33
11	100	2006-05-22	13
11	144	2006-05-22	13
11	304	2006-05-22	13
11	145	2006-05-22	13
11	141	2006-05-22	13
11	128	2006-05-22	13
11	6	2006-05-22	13
11	49	2006-05-22	13
11	8	2006-05-22	13
11	143	2006-05-22	13
11	142	2006-05-22	13
11	12	2006-05-22	13
11	129	2006-05-22	13
11	131	2006-05-22	13
11	16	2006-05-22	13
11	119	2006-05-22	13
11	19	2006-05-22	13
11	121	2006-05-22	13
11	122	2006-05-22	13
11	21	2006-05-22	13
11	56	2006-05-22	13
12	100	2006-05-22	16
12	144	2006-05-22	16
12	101	2006-05-22	16
12	102	2006-05-22	16
12	304	2006-05-22	16
12	145	2006-05-22	16
12	141	2006-05-22	16
12	24	2006-05-22	16
12	128	2006-05-22	16
12	6	2006-05-22	16
12	49	2006-05-22	16
12	25	2006-05-22	16
12	26	2006-05-22	16
12	33	2006-05-22	16
12	27	2006-05-22	16
12	143	2006-05-22	16
12	142	2006-05-22	16
12	12	2006-05-22	16
12	129	2006-05-22	16
12	131	2006-05-22	16
12	16	2006-05-22	16
12	28	2006-05-22	16
12	119	2006-05-22	16
12	121	2006-05-22	16
12	122	2006-05-22	16
12	30	2006-05-22	16
12	21	2006-05-22	16
12	56	2006-05-22	16
12	610	2006-05-22	16
13	148	2006-05-22	27
13	649	2006-05-22	27
13	648	2006-05-22	27
13	650	2006-05-22	27
13	653	2006-05-22	27
13	651	2006-05-22	27
13	652	2006-05-22	27
13	135	2006-05-22	27
13	136	2006-05-22	27
14	135	2006-05-22	31
15	135	2006-05-22	19
16	49	2006-05-22	57
16	134	2006-05-22	57
16	56	2006-05-22	57
18	129	2006-05-22	2
18	134	2006-05-22	2
19	129	2006-05-22	2
20	100	2006-05-23	25
20	101	2006-05-23	25
20	102	2006-05-23	25
20	304	2006-05-23	25
20	106	2006-05-23	25
20	605	2006-05-23	25
20	24	2006-05-23	25
20	6	2006-05-23	25
20	25	2006-05-23	25
20	26	2006-05-23	25
20	33	2006-05-23	25
20	27	2006-05-23	25
20	303	2006-05-23	25
20	28	2006-05-23	25
20	30	2006-05-23	25
20	609	2006-05-23	25
20	610	2006-05-23	25
20	122	2006-05-23	25
20	121	2006-05-23	25
20	655	2006-05-23	25
20	16	2006-05-23	25
20	117	2006-05-23	25
20	119	2006-05-23	25
20	21	2006-05-23	25
20	56	2006-05-23	25
21	25	2006-05-23	23
21	303	2006-05-23	23
21	16	2006-05-23	23
20	656	2006-05-23	25
22	440	2006-05-23	1
22	151	2006-05-23	1
23	440	2006-05-23	1
23	151	2006-05-23	1
24	100	2006-05-23	1
24	144	2006-05-23	1
24	101	2006-05-23	1
24	102	2006-05-23	1
24	145	2006-05-23	1
24	141	2006-05-23	1
24	146	2006-05-23	1
24	24	2006-05-23	1
24	128	2006-05-23	1
24	49	2006-05-23	1
24	26	2006-05-23	1
24	33	2006-05-23	1
24	27	2006-05-23	1
24	148	2006-05-23	1
24	152	2006-05-23	1
24	150	2006-05-23	1
24	143	2006-05-23	1
24	142	2006-05-23	1
24	153	2006-05-23	1
24	132	2006-05-23	1
24	12	2006-05-23	1
24	131	2006-05-23	1
24	16	2006-05-23	1
24	28	2006-05-23	1
24	117	2006-05-23	1
24	136	2006-05-23	1
24	119	2006-05-23	1
24	122	2006-05-23	1
24	138	2006-05-23	1
24	139	2006-05-23	1
24	21	2006-05-23	1
24	56	2006-05-23	1
25	100	2006-05-23	1
25	144	2006-05-23	1
25	101	2006-05-23	1
25	102	2006-05-23	1
25	145	2006-05-23	1
25	141	2006-05-23	1
25	146	2006-05-23	1
25	24	2006-05-23	1
25	128	2006-05-23	1
25	49	2006-05-23	1
25	26	2006-05-23	1
25	33	2006-05-23	1
25	27	2006-05-23	1
25	148	2006-05-23	1
25	152	2006-05-23	1
25	150	2006-05-23	1
25	143	2006-05-23	1
25	142	2006-05-23	1
25	153	2006-05-23	1
25	132	2006-05-23	1
25	12	2006-05-23	1
25	131	2006-05-23	1
25	16	2006-05-23	1
25	28	2006-05-23	1
25	117	2006-05-23	1
25	136	2006-05-23	1
25	119	2006-05-23	1
25	122	2006-05-23	1
25	138	2006-05-23	1
25	139	2006-05-23	1
25	21	2006-05-23	1
25	56	2006-05-23	1
26	114	2006-05-23	1
27	100	2006-05-23	1
27	144	2006-05-23	1
27	101	2006-05-23	1
27	102	2006-05-23	1
27	145	2006-05-23	1
27	141	2006-05-23	1
27	146	2006-05-23	1
27	24	2006-05-23	1
27	128	2006-05-23	1
27	49	2006-05-23	1
27	26	2006-05-23	1
27	33	2006-05-23	1
27	27	2006-05-23	1
27	148	2006-05-23	1
27	152	2006-05-23	1
27	150	2006-05-23	1
27	143	2006-05-23	1
27	142	2006-05-23	1
27	153	2006-05-23	1
27	132	2006-05-23	1
27	12	2006-05-23	1
27	131	2006-05-23	1
27	16	2006-05-23	1
27	28	2006-05-23	1
27	117	2006-05-23	1
27	136	2006-05-23	1
27	119	2006-05-23	1
27	122	2006-05-23	1
27	138	2006-05-23	1
27	139	2006-05-23	1
27	21	2006-05-23	1
27	56	2006-05-23	1
31	100	2006-05-23	1
31	144	2006-05-23	1
31	101	2006-05-23	1
31	102	2006-05-23	1
31	145	2006-05-23	1
31	141	2006-05-23	1
31	146	2006-05-23	1
31	24	2006-05-23	1
31	128	2006-05-23	1
31	49	2006-05-23	1
31	26	2006-05-23	1
31	33	2006-05-23	1
31	27	2006-05-23	1
31	148	2006-05-23	1
31	152	2006-05-23	1
31	150	2006-05-23	1
31	143	2006-05-23	1
31	142	2006-05-23	1
31	153	2006-05-23	1
31	132	2006-05-23	1
31	12	2006-05-23	1
31	131	2006-05-23	1
31	16	2006-05-23	1
31	28	2006-05-23	1
31	117	2006-05-23	1
31	136	2006-05-23	1
31	119	2006-05-23	1
31	122	2006-05-23	1
31	138	2006-05-23	1
31	139	2006-05-23	1
31	21	2006-05-23	1
31	56	2006-05-23	1
32	136	2006-05-23	1
33	100	2006-05-23	26
33	144	2006-05-23	26
33	101	2006-05-23	26
33	102	2006-05-23	26
33	304	2006-05-23	26
33	106	2006-05-23	26
33	605	2006-05-23	26
33	24	2006-05-23	26
33	6	2006-05-23	26
33	25	2006-05-23	26
33	26	2006-05-23	26
33	33	2006-05-23	26
33	27	2006-05-23	26
33	303	2006-05-23	26
33	16	2006-05-23	26
33	28	2006-05-23	26
33	21	2006-05-23	26
33	610	2006-05-23	26
33	657	2006-05-23	26
33	654	2006-05-23	26
33	655	2006-05-23	26
33	658	2006-05-23	26
33	659	2006-05-23	26
33	660	2006-05-23	26
40	100	2006-06-19	36
40	67	2006-06-19	36
40	101	2006-06-19	36
40	102	2006-06-19	36
40	437	2006-06-19	36
40	158	2006-06-19	36
40	145	2006-06-19	36
40	141	2006-06-19	36
40	568	2006-06-19	36
40	146	2006-06-19	36
40	637	2006-06-19	36
40	24	2006-06-19	36
40	439	2006-06-19	36
40	4	2006-06-19	36
40	427	2006-06-19	36
40	49	2006-06-19	36
40	71	2006-06-19	36
40	26	2006-06-19	36
40	33	2006-06-19	36
40	27	2006-06-19	36
40	73	2006-06-19	36
40	360	2006-06-19	36
40	570	2006-06-19	36
40	436	2006-06-19	36
40	484	2006-06-19	36
40	51	2006-06-19	36
40	571	2006-06-19	36
40	442	2006-06-19	36
40	152	2006-06-19	36
40	586	2006-06-19	36
40	143	2006-06-19	36
40	74	2006-06-19	36
40	75	2006-06-19	36
40	76	2006-06-19	36
40	566	2006-06-19	36
40	443	2006-06-19	36
40	52	2006-06-19	36
40	57	2006-06-19	36
40	59	2006-06-19	36
40	673	2006-06-19	36
40	34	2006-06-19	36
40	133	2006-06-19	36
40	666	2006-06-19	36
40	54	2006-06-19	36
40	352	2006-06-19	36
40	323	2006-06-19	36
40	672	2006-06-19	36
40	12	2006-06-19	36
40	14	2006-06-19	36
40	493	2006-06-19	36
40	674	2006-06-19	36
40	675	2006-06-19	36
40	131	2006-06-19	36
40	581	2006-06-19	36
40	83	2006-06-19	36
40	616	2006-06-19	36
40	114	2006-06-19	36
40	16	2006-06-19	36
40	28	2006-06-19	36
40	116	2006-06-19	36
40	85	2006-06-19	36
40	118	2006-06-19	36
40	119	2006-06-19	36
40	96	2006-06-19	36
40	120	2006-06-19	36
40	137	2006-06-19	36
40	569	2006-06-19	36
40	123	2006-06-19	36
40	31	2006-06-19	36
40	32	2006-06-19	36
40	126	2006-06-19	36
40	56	2006-06-19	36
40	681	2006-06-19	36
41	100	2006-05-23	1
41	144	2006-05-23	1
41	101	2006-05-23	1
41	102	2006-05-23	1
41	304	2006-05-23	1
41	145	2006-05-23	1
41	141	2006-05-23	1
41	106	2006-05-23	1
41	605	2006-05-23	1
41	24	2006-05-23	1
41	128	2006-05-23	1
41	6	2006-05-23	1
41	49	2006-05-23	1
41	25	2006-05-23	1
41	26	2006-05-23	1
41	33	2006-05-23	1
41	27	2006-05-23	1
41	143	2006-05-23	1
41	142	2006-05-23	1
41	607	2006-05-23	1
41	57	2006-05-23	1
41	59	2006-05-23	1
41	12	2006-05-23	1
41	129	2006-05-23	1
41	131	2006-05-23	1
41	303	2006-05-23	1
41	114	2006-05-23	1
41	16	2006-05-23	1
41	28	2006-05-23	1
41	117	2006-05-23	1
41	119	2006-05-23	1
41	122	2006-05-23	1
41	121	2006-05-23	1
41	609	2006-05-23	1
41	21	2006-05-23	1
41	31	2006-05-23	1
41	32	2006-05-23	1
41	56	2006-05-23	1
41	610	2006-05-23	1
41	655	2006-05-23	1
43	143	2006-06-19	2
43	183	2006-06-19	2
43	175	2006-06-19	2
43	57	2006-06-19	2
43	168	2006-06-19	2
44	196	2006-06-21	17
44	191	2006-06-21	17
44	192	2006-06-21	17
44	194	2006-06-21	17
44	211	2006-06-21	17
44	200	2006-06-21	17
44	252	2006-06-21	17
44	49	2006-06-21	17
44	235	2006-06-21	17
44	248	2006-06-21	17
44	254	2006-06-21	17
44	143	2006-06-21	17
44	251	2006-06-21	17
44	243	2006-06-21	17
44	222	2006-06-21	17
44	216	2006-06-21	17
44	217	2006-06-21	17
44	223	2006-06-21	17
44	218	2006-06-21	17
44	219	2006-06-21	17
44	224	2006-06-21	17
44	220	2006-06-21	17
44	183	2006-06-21	17
44	1	2006-06-21	17
44	187	2006-06-21	17
44	257	2006-06-21	17
44	234	2006-06-21	17
44	12	2006-06-21	17
44	240	2006-06-21	17
44	129	2006-06-21	17
44	250	2006-06-21	17
44	114	2006-06-21	17
44	117	2006-06-21	17
44	119	2006-06-21	17
44	221	2006-06-21	17
44	247	2006-06-21	17
44	120	2006-06-21	17
44	21	2006-06-21	17
44	258	2006-06-21	17
45	225	2006-06-22	18
45	201	2006-06-22	18
45	202	2006-06-22	1
45	260	2006-06-22	18
45	226	2006-06-22	18
45	261	2006-06-22	18
45	262	2006-06-22	18
45	263	2006-06-22	18
45	264	2006-06-22	18
45	236	2006-06-22	18
45	237	2006-06-22	1
45	265	2006-06-22	18
45	266	2006-06-22	18
45	267	2006-06-22	18
45	279	2006-06-22	18
45	280	2006-06-22	18
45	281	2006-06-22	18
45	282	2006-06-22	18
45	233	2006-06-22	18
45	284	2006-06-22	18
45	285	2006-06-22	18
45	286	2006-06-22	18
45	283	2006-06-22	18
45	249	2006-06-22	18
45	288	2006-06-22	18
45	289	2006-06-22	18
45	290	2006-06-22	18
45	184	2006-06-22	18
45	291	2006-06-22	18
45	244	2006-06-22	18
45	292	2006-06-22	18
45	293	2006-06-22	18
45	294	2006-06-22	18
45	295	2006-06-22	18
45	684	2006-06-22	18
47	296	2006-06-22	7
47	297	2006-06-22	7
47	143	2006-06-22	7
47	299	2006-06-22	7
47	183	2006-06-22	7
47	175	2006-06-22	7
47	12	2006-06-22	7
47	301	2006-06-22	7
47	114	2006-06-22	7
47	17	2006-06-22	7
47	122	2006-06-22	7
48	65	2006-06-22	26
48	340	2006-06-22	26
48	62	2006-06-22	26
48	325	2006-06-22	26
48	305	2006-06-22	26
48	326	2006-06-22	26
48	71	2006-06-22	26
48	320	2006-06-22	26
48	91	2006-06-22	26
48	73	2006-06-22	26
48	343	2006-06-22	26
48	143	2006-06-22	26
48	243	2006-06-22	26
48	327	2006-06-22	26
48	333	2006-06-22	26
48	334	2006-06-22	26
48	335	2006-06-22	26
48	336	2006-06-22	26
48	322	2006-06-22	26
48	34	2006-06-22	26
48	339	2006-06-22	26
48	323	2006-06-22	26
48	12	2006-06-22	26
48	330	2006-06-22	26
48	331	2006-06-22	26
48	338	2006-06-22	26
48	129	2006-06-22	26
48	332	2006-06-22	26
48	301	2006-06-22	26
48	345	2006-06-22	26
48	99	2006-06-22	26
48	113	2006-06-22	26
48	171	2006-06-22	26
48	324	2006-06-22	26
48	118	2006-06-22	26
48	344	2006-06-22	26
48	96	2006-06-22	26
48	123	2006-06-22	26
48	346	2006-06-22	26
48	688	2006-06-22	26
48	1	2006-06-22	26
48	10	2006-06-22	26
49	65	2006-06-22	26
49	340	2006-06-22	26
49	305	2006-06-22	26
49	326	2006-06-22	26
49	71	2006-06-22	26
49	320	2006-06-22	26
49	91	2006-06-22	26
49	73	2006-06-22	26
49	343	2006-06-22	26
49	143	2006-06-22	26
49	243	2006-06-22	26
49	34	2006-06-22	26
49	339	2006-06-22	26
49	323	2006-06-22	26
49	12	2006-06-22	26
49	338	2006-06-22	26
49	129	2006-06-22	26
49	301	2006-06-22	26
49	345	2006-06-22	26
49	113	2006-06-22	26
49	171	2006-06-22	26
49	324	2006-06-22	26
49	118	2006-06-22	26
49	344	2006-06-22	26
49	96	2006-06-22	26
49	123	2006-06-22	26
49	346	2006-06-22	26
49	688	2006-06-22	26
49	1	2006-06-22	26
49	10	2006-06-22	26
49	167	2006-06-22	26
49	319	2006-06-22	26
50	65	2006-06-22	26
50	340	2006-06-22	26
50	305	2006-06-22	26
50	326	2006-06-22	26
50	71	2006-06-22	26
50	320	2006-06-22	26
50	91	2006-06-22	26
50	73	2006-06-22	26
50	343	2006-06-22	26
50	143	2006-06-22	26
50	243	2006-06-22	26
50	327	2006-06-22	26
50	333	2006-06-22	26
50	334	2006-06-22	26
50	335	2006-06-22	26
50	336	2006-06-22	26
50	34	2006-06-22	26
50	323	2006-06-22	26
50	12	2006-06-22	26
50	338	2006-06-22	26
50	129	2006-06-22	26
50	301	2006-06-22	26
50	345	2006-06-22	26
50	113	2006-06-22	26
50	171	2006-06-22	26
50	324	2006-06-22	26
50	118	2006-06-22	26
50	344	2006-06-22	26
50	96	2006-06-22	26
50	123	2006-06-22	26
50	346	2006-06-22	26
50	688	2006-06-22	26
50	1	2006-06-22	26
50	10	2006-06-22	26
50	98	2006-06-22	26
51	65	2006-06-22	25
51	326	2006-06-22	25
51	71	2006-06-22	25
51	320	2006-06-22	25
51	91	2006-06-22	25
51	73	2006-06-22	25
51	343	2006-06-22	25
51	243	2006-06-22	25
51	34	2006-06-22	25
51	339	2006-06-22	25
51	323	2006-06-22	25
51	338	2006-06-22	25
51	301	2006-06-22	25
51	345	2006-06-22	25
51	113	2006-06-22	25
51	171	2006-06-22	25
51	324	2006-06-22	25
51	118	2006-06-22	25
51	344	2006-06-22	25
51	96	2006-06-22	25
51	346	2006-06-22	25
51	688	2006-06-22	25
51	1	2006-06-22	25
51	10	2006-06-22	25
51	167	2006-06-22	25
51	319	2006-06-22	25
52	65	2006-06-22	26
52	340	2006-06-22	26
52	305	2006-06-22	26
52	326	2006-06-22	26
52	71	2006-06-22	26
52	320	2006-06-22	26
52	91	2006-06-22	26
52	73	2006-06-22	26
52	343	2006-06-22	26
52	143	2006-06-22	26
52	243	2006-06-22	26
52	34	2006-06-22	26
52	339	2006-06-22	26
52	323	2006-06-22	26
52	12	2006-06-22	26
52	338	2006-06-22	26
52	129	2006-06-22	26
52	301	2006-06-22	26
52	345	2006-06-22	26
52	113	2006-06-22	26
52	171	2006-06-22	26
52	324	2006-06-22	26
52	118	2006-06-22	26
52	344	2006-06-22	26
52	96	2006-06-22	26
52	123	2006-06-22	26
52	346	2006-06-22	26
52	688	2006-06-22	26
52	1	2006-06-22	26
52	10	2006-06-22	26
52	167	2006-06-22	26
52	319	2006-06-22	26
53	65	2006-06-22	25
53	340	2006-06-22	25
53	305	2006-06-22	25
53	326	2006-06-22	25
53	71	2006-06-22	25
53	320	2006-06-22	25
53	91	2006-06-22	25
53	73	2006-06-22	25
53	343	2006-06-22	25
53	143	2006-06-22	25
53	243	2006-06-22	25
53	34	2006-06-22	25
53	339	2006-06-22	25
53	323	2006-06-22	25
53	12	2006-06-22	25
53	338	2006-06-22	25
53	129	2006-06-22	25
53	301	2006-06-22	25
53	345	2006-06-22	25
53	113	2006-06-22	25
53	171	2006-06-22	25
53	324	2006-06-22	25
53	118	2006-06-22	25
53	344	2006-06-22	25
53	96	2006-06-22	25
53	123	2006-06-22	25
53	346	2006-06-22	25
53	688	2006-06-22	25
53	1	2006-06-22	25
53	10	2006-06-22	25
53	167	2006-06-22	25
53	319	2006-06-22	25
54	65	2006-06-22	25
54	340	2006-06-22	25
54	305	2006-06-22	25
54	326	2006-06-22	25
54	71	2006-06-22	25
54	320	2006-06-22	25
54	91	2006-06-22	25
54	73	2006-06-22	25
54	343	2006-06-22	25
54	143	2006-06-22	25
54	243	2006-06-22	25
54	34	2006-06-22	25
54	339	2006-06-22	25
54	323	2006-06-22	25
54	12	2006-06-22	25
54	338	2006-06-22	25
54	129	2006-06-22	25
54	301	2006-06-22	25
54	345	2006-06-22	25
54	113	2006-06-22	25
54	171	2006-06-22	25
54	324	2006-06-22	25
54	118	2006-06-22	25
54	344	2006-06-22	25
54	96	2006-06-22	25
54	123	2006-06-22	25
54	346	2006-06-22	25
54	688	2006-06-22	25
54	1	2006-06-22	25
54	10	2006-06-22	25
54	167	2006-06-22	25
54	319	2006-06-22	25
56	65	2006-06-22	25
56	340	2006-06-22	25
56	305	2006-06-22	25
56	326	2006-06-22	25
56	71	2006-06-22	25
56	320	2006-06-22	25
56	91	2006-06-22	25
56	73	2006-06-22	25
56	343	2006-06-22	25
56	143	2006-06-22	25
56	243	2006-06-22	25
56	34	2006-06-22	25
56	339	2006-06-22	25
56	323	2006-06-22	25
56	12	2006-06-22	25
56	338	2006-06-22	25
56	129	2006-06-22	25
56	301	2006-06-22	25
56	345	2006-06-22	25
56	113	2006-06-22	25
56	171	2006-06-22	25
56	324	2006-06-22	25
56	118	2006-06-22	25
56	344	2006-06-22	25
56	96	2006-06-22	25
56	123	2006-06-22	25
56	346	2006-06-22	25
56	688	2006-06-22	25
56	1	2006-06-22	25
56	10	2006-06-22	25
56	167	2006-06-22	25
56	319	2006-06-22	25
57	65	2006-06-22	25
57	340	2006-06-22	25
57	305	2006-06-22	25
57	326	2006-06-22	25
57	71	2006-06-22	25
57	320	2006-06-22	25
57	91	2006-06-22	25
57	73	2006-06-22	25
57	343	2006-06-22	25
57	143	2006-06-22	25
57	243	2006-06-22	25
57	34	2006-06-22	25
57	339	2006-06-22	25
57	323	2006-06-22	25
57	12	2006-06-22	25
57	338	2006-06-22	25
57	129	2006-06-22	25
57	301	2006-06-22	25
57	345	2006-06-22	25
57	113	2006-06-22	25
57	171	2006-06-22	25
57	324	2006-06-22	25
57	118	2006-06-22	25
57	344	2006-06-22	25
57	96	2006-06-22	25
57	123	2006-06-22	25
57	346	2006-06-22	25
57	688	2006-06-22	25
57	1	2006-06-22	25
57	10	2006-06-22	25
57	167	2006-06-22	25
57	319	2006-06-22	25
51	100	2006-06-22	25
51	340	2006-06-22	26
51	101	2006-06-22	25
51	102	2006-06-22	25
51	304	2006-06-22	25
51	145	2006-06-22	25
51	141	2006-06-22	25
51	24	2006-06-22	25
51	305	2006-06-22	25
51	308	2006-06-22	25
51	26	2006-06-22	25
51	33	2006-06-22	25
51	27	2006-06-22	25
51	143	2006-06-22	25
51	299	2006-06-22	25
51	311	2006-06-22	1
51	60	2006-06-22	25
51	61	2006-06-22	25
51	12	2006-06-22	25
51	129	2006-06-22	25
51	313	2006-06-22	25
51	114	2006-06-22	25
51	16	2006-06-22	25
51	28	2006-06-22	25
51	17	2006-06-22	25
51	119	2006-06-22	25
51	123	2006-06-22	25
51	31	2006-06-22	25
51	32	2006-06-22	25
51	316	2006-06-22	25
51	56	2006-06-22	25
60	100	2006-06-22	25
60	340	2006-06-22	25
60	101	2006-06-22	25
60	102	2006-06-22	25
60	304	2006-06-22	25
60	145	2006-06-22	25
60	141	2006-06-22	25
60	24	2006-06-22	25
60	305	2006-06-22	25
60	308	2006-06-22	25
60	26	2006-06-22	25
60	33	2006-06-22	25
60	27	2006-06-22	25
60	690	2006-06-22	25
60	143	2006-06-22	25
60	299	2006-06-22	25
60	311	2006-06-22	1
60	60	2006-06-22	25
60	61	2006-06-22	25
60	12	2006-06-22	25
60	129	2006-06-22	25
60	313	2006-06-22	25
60	114	2006-06-22	25
60	16	2006-06-22	25
60	28	2006-06-22	25
60	17	2006-06-22	25
60	119	2006-06-22	25
60	689	2006-06-22	25
60	123	2006-06-22	25
60	31	2006-06-22	25
60	32	2006-06-22	25
60	316	2006-06-22	25
60	56	2006-06-22	25
61	100	2006-06-22	25
61	340	2006-06-22	25
61	101	2006-06-22	25
61	102	2006-06-22	25
61	304	2006-06-22	25
61	145	2006-06-22	25
61	141	2006-06-22	25
61	24	2006-06-22	25
61	305	2006-06-22	25
61	308	2006-06-22	25
61	26	2006-06-22	25
61	33	2006-06-22	25
61	27	2006-06-22	25
61	690	2006-06-22	25
61	143	2006-06-22	25
61	299	2006-06-22	25
61	311	2006-06-22	25
61	60	2006-06-22	25
61	61	2006-06-22	25
61	12	2006-06-22	25
61	129	2006-06-22	25
61	313	2006-06-22	25
61	114	2006-06-22	25
61	16	2006-06-22	25
61	28	2006-06-22	25
61	17	2006-06-22	25
61	119	2006-06-22	25
61	689	2006-06-22	25
61	123	2006-06-22	25
61	31	2006-06-22	25
61	32	2006-06-22	25
61	316	2006-06-22	25
61	56	2006-06-22	25
62	100	2006-06-22	25
62	340	2006-06-22	25
62	101	2006-06-22	25
62	102	2006-06-22	25
62	304	2006-06-22	25
62	145	2006-06-22	25
62	141	2006-06-22	25
62	24	2006-06-22	25
62	305	2006-06-22	25
62	308	2006-06-22	25
62	26	2006-06-22	25
62	33	2006-06-22	25
62	27	2006-06-22	25
62	690	2006-06-22	25
62	143	2006-06-22	25
62	299	2006-06-22	25
62	311	2006-06-22	25
62	60	2006-06-22	25
62	61	2006-06-22	25
62	12	2006-06-22	25
62	129	2006-06-22	25
62	313	2006-06-22	25
62	114	2006-06-22	25
62	16	2006-06-22	25
62	28	2006-06-22	25
62	17	2006-06-22	25
62	119	2006-06-22	25
62	689	2006-06-22	25
62	123	2006-06-22	25
62	31	2006-06-22	25
62	32	2006-06-22	25
62	316	2006-06-22	25
62	56	2006-06-22	25
63	100	2006-06-22	25
63	340	2006-06-22	25
63	101	2006-06-22	25
63	102	2006-06-22	25
63	304	2006-06-22	25
63	145	2006-06-22	25
63	141	2006-06-22	25
63	24	2006-06-22	25
63	305	2006-06-22	25
63	308	2006-06-22	25
63	26	2006-06-22	25
63	33	2006-06-22	25
63	27	2006-06-22	25
63	690	2006-06-22	25
63	143	2006-06-22	25
63	299	2006-06-22	25
63	311	2006-06-22	25
63	60	2006-06-22	25
63	61	2006-06-22	25
63	12	2006-06-22	25
63	129	2006-06-22	25
63	313	2006-06-22	25
63	114	2006-06-22	25
63	16	2006-06-22	25
63	28	2006-06-22	25
63	17	2006-06-22	25
63	119	2006-06-22	25
63	689	2006-06-22	25
63	123	2006-06-22	25
63	31	2006-06-22	25
63	32	2006-06-22	25
63	316	2006-06-22	25
63	56	2006-06-22	25
65	100	2006-06-22	25
65	340	2006-06-22	25
65	101	2006-06-22	25
65	102	2006-06-22	25
65	304	2006-06-22	25
65	145	2006-06-22	25
65	141	2006-06-22	25
65	24	2006-06-22	25
65	305	2006-06-22	25
65	308	2006-06-22	25
65	26	2006-06-22	25
65	33	2006-06-22	25
65	27	2006-06-22	25
65	690	2006-06-22	25
65	143	2006-06-22	25
65	299	2006-06-22	25
65	311	2006-06-22	25
65	60	2006-06-22	25
65	61	2006-06-22	25
65	12	2006-06-22	25
65	129	2006-06-22	25
65	313	2006-06-22	25
65	114	2006-06-22	25
65	16	2006-06-22	25
65	28	2006-06-22	25
65	17	2006-06-22	25
65	119	2006-06-22	25
65	689	2006-06-22	25
65	123	2006-06-22	25
65	31	2006-06-22	25
65	32	2006-06-22	25
65	316	2006-06-22	25
65	56	2006-06-22	25
66	100	2006-06-22	25
66	340	2006-06-22	25
66	101	2006-06-22	25
66	102	2006-06-22	25
66	304	2006-06-22	25
66	145	2006-06-22	25
66	141	2006-06-22	25
66	24	2006-06-22	25
66	305	2006-06-22	25
66	308	2006-06-22	25
66	26	2006-06-22	25
66	33	2006-06-22	25
66	27	2006-06-22	25
66	690	2006-06-22	25
66	143	2006-06-22	25
66	299	2006-06-22	25
66	311	2006-06-22	25
66	60	2006-06-22	25
66	61	2006-06-22	25
66	12	2006-06-22	25
66	129	2006-06-22	25
66	313	2006-06-22	25
66	114	2006-06-22	25
66	16	2006-06-22	25
66	28	2006-06-22	25
66	17	2006-06-22	25
66	119	2006-06-22	25
66	689	2006-06-22	25
66	123	2006-06-22	25
66	31	2006-06-22	25
66	32	2006-06-22	25
66	316	2006-06-22	25
66	56	2006-06-22	25
67	100	2006-06-22	25
67	340	2006-06-22	25
67	101	2006-06-22	25
67	102	2006-06-22	25
67	304	2006-06-22	25
67	145	2006-06-22	25
67	141	2006-06-22	25
67	24	2006-06-22	25
67	305	2006-06-22	25
67	308	2006-06-22	25
67	26	2006-06-22	25
67	33	2006-06-22	25
67	27	2006-06-22	25
67	690	2006-06-22	25
67	143	2006-06-22	25
67	299	2006-06-22	25
67	311	2006-06-22	25
67	60	2006-06-22	25
67	61	2006-06-22	25
67	12	2006-06-22	25
67	129	2006-06-22	25
67	313	2006-06-22	25
67	114	2006-06-22	25
67	16	2006-06-22	25
67	28	2006-06-22	25
67	17	2006-06-22	25
67	119	2006-06-22	25
67	689	2006-06-22	25
67	123	2006-06-22	25
67	31	2006-06-22	25
67	32	2006-06-22	25
67	316	2006-06-22	25
67	56	2006-06-22	25
69	100	2006-06-22	25
69	340	2006-06-22	25
69	101	2006-06-22	25
69	102	2006-06-22	25
69	304	2006-06-22	25
69	145	2006-06-22	25
69	141	2006-06-22	25
69	24	2006-06-22	25
69	305	2006-06-22	25
69	308	2006-06-22	25
69	26	2006-06-22	25
69	33	2006-06-22	25
69	27	2006-06-22	25
69	690	2006-06-22	25
69	143	2006-06-22	25
69	299	2006-06-22	25
69	311	2006-06-22	25
69	60	2006-06-22	25
69	61	2006-06-22	25
69	12	2006-06-22	25
69	129	2006-06-22	25
69	313	2006-06-22	25
69	114	2006-06-22	25
69	16	2006-06-22	25
69	28	2006-06-22	25
69	17	2006-06-22	25
69	119	2006-06-22	25
69	689	2006-06-22	25
69	123	2006-06-22	25
69	31	2006-06-22	25
69	32	2006-06-22	25
69	316	2006-06-22	25
69	56	2006-06-22	25
67	691	2006-06-22	25
74	100	2006-06-22	24
74	340	2006-06-22	24
74	101	2006-06-22	24
74	102	2006-06-22	24
74	304	2006-06-22	24
74	145	2006-06-22	24
74	141	2006-06-22	24
74	24	2006-06-22	24
74	305	2006-06-22	25
74	308	2006-06-22	24
74	26	2006-06-22	24
74	33	2006-06-22	24
74	27	2006-06-22	24
74	690	2006-06-22	24
74	143	2006-06-22	24
74	299	2006-06-22	25
74	311	2006-06-22	24
74	60	2006-06-22	24
74	61	2006-06-22	24
74	12	2006-06-22	24
74	129	2006-06-22	24
74	313	2006-06-22	24
74	114	2006-06-22	24
74	16	2006-06-22	24
74	28	2006-06-22	24
74	17	2006-06-22	24
74	119	2006-06-22	24
74	689	2006-06-22	24
74	123	2006-06-22	24
74	31	2006-06-22	24
74	32	2006-06-22	24
74	316	2006-06-22	24
74	56	2006-06-22	25
74	310	2006-06-26	6
74	312	2006-06-26	6
76	100	2006-06-22	25
76	340	2006-06-22	25
76	101	2006-06-22	25
76	102	2006-06-22	25
76	304	2006-06-22	25
76	145	2006-06-22	25
76	141	2006-06-22	25
76	24	2006-06-22	25
76	308	2006-06-22	25
76	26	2006-06-22	25
76	33	2006-06-22	25
76	27	2006-06-22	25
76	690	2006-06-22	25
76	143	2006-06-22	25
76	299	2006-06-22	25
76	60	2006-06-22	25
76	61	2006-06-22	25
76	12	2006-06-22	25
76	313	2006-06-22	25
76	114	2006-06-22	25
76	16	2006-06-22	25
76	28	2006-06-22	25
76	17	2006-06-22	25
76	119	2006-06-22	25
76	689	2006-06-22	25
76	123	2006-06-22	25
76	31	2006-06-22	25
76	32	2006-06-22	25
76	316	2006-06-22	25
76	56	2006-06-22	25
76	312	2006-06-26	25
76	311	2006-06-22	1
76	129	2006-06-22	25
77	100	2006-06-22	25
77	340	2006-06-22	25
77	101	2006-06-22	25
77	102	2006-06-22	25
77	304	2006-06-22	25
77	145	2006-06-22	25
77	141	2006-06-22	25
77	24	2006-06-22	25
77	305	2006-06-22	25
77	308	2006-06-22	25
77	26	2006-06-22	25
77	33	2006-06-22	25
77	27	2006-06-22	25
77	690	2006-06-22	25
77	143	2006-06-22	25
77	299	2006-06-22	25
77	311	2006-06-22	25
77	60	2006-06-22	25
77	61	2006-06-22	25
77	12	2006-06-22	25
77	129	2006-06-22	25
77	313	2006-06-22	25
77	114	2006-06-22	25
77	16	2006-06-22	25
77	28	2006-06-22	25
77	17	2006-06-22	25
77	119	2006-06-22	25
77	689	2006-06-22	25
77	123	2006-06-22	25
77	31	2006-06-22	25
77	32	2006-06-22	25
77	316	2006-06-22	25
77	56	2006-06-22	25
77	309	2006-06-26	25
78	100	2006-06-22	25
78	340	2006-06-22	25
78	101	2006-06-22	25
78	102	2006-06-22	25
78	304	2006-06-22	25
78	145	2006-06-22	25
78	141	2006-06-22	25
78	24	2006-06-22	25
78	305	2006-06-22	25
78	308	2006-06-22	25
78	26	2006-06-22	25
78	33	2006-06-22	25
78	27	2006-06-22	25
78	690	2006-06-22	25
78	143	2006-06-22	25
78	299	2006-06-22	25
78	311	2006-06-22	25
78	60	2006-06-22	25
78	61	2006-06-22	25
78	12	2006-06-22	25
78	129	2006-06-22	25
78	313	2006-06-22	25
78	114	2006-06-22	25
78	16	2006-06-22	25
78	28	2006-06-22	25
78	17	2006-06-22	25
78	119	2006-06-22	25
78	689	2006-06-22	25
78	123	2006-06-22	25
78	31	2006-06-22	25
78	32	2006-06-22	25
78	316	2006-06-22	25
78	56	2006-06-22	25
79	304	2006-06-22	26
79	141	2006-06-22	26
79	299	2006-06-22	26
79	60	2006-06-22	26
79	61	2006-06-22	26
79	12	2006-06-22	26
79	114	2006-06-22	26
79	16	2006-06-22	26
79	316	2006-06-22	26
79	56	2006-06-22	26
79	315	2006-06-26	26
79	20	2006-06-26	26
79	691	2006-06-22	26
80	494	2006-06-26	3
80	495	2006-06-26	3
80	405	2006-06-26	3
80	406	2006-06-26	3
80	75	2006-06-26	3
80	492	2006-06-26	3
80	10	2006-06-26	3
80	12	2006-06-26	3
80	300	2006-06-26	3
80	113	2006-06-26	3
80	344	2006-06-26	3
80	491	2006-06-26	3
80	123	2006-06-26	3
80	56	2006-06-26	3
80	350	2006-06-26	3
80	693	2006-06-26	3
82	351	2006-06-26	17
82	483	2006-06-26	17
82	405	2006-06-26	17
82	10	2006-06-26	17
82	12	2006-06-26	17
82	493	2006-06-26	17
82	16	2006-06-26	17
82	693	2006-06-26	17
82	344	2006-06-26	17
82	123	2006-06-26	17
82	56	2006-06-26	25
83	424	2006-06-26	10
83	417	2006-06-26	10
83	418	2006-06-26	10
83	101	2006-06-26	10
83	102	2006-06-26	10
83	419	2006-06-26	10
83	439	2006-06-26	10
83	440	2006-06-26	10
83	427	2006-06-26	10
83	26	2006-06-26	10
83	33	2006-06-26	10
83	27	2006-06-26	10
83	401	2006-06-26	10
83	361	2006-06-26	10
83	446	2006-06-26	10
83	436	2006-06-26	10
83	484	2006-06-26	10
83	420	2006-06-26	10
83	421	2006-06-26	10
83	485	2006-06-26	10
83	441	2006-06-26	10
83	152	2006-06-26	10
83	343	2006-06-26	10
83	472	2006-06-26	10
83	405	2006-06-26	10
83	75	2006-06-26	10
83	473	2006-06-26	10
83	443	2006-06-26	10
83	10	2006-06-26	10
83	34	2006-06-26	10
83	444	2006-06-26	10
83	352	2006-06-26	10
83	12	2006-06-26	10
83	493	2006-06-26	10
83	104	2006-06-26	10
83	16	2006-06-26	10
83	28	2006-06-26	10
83	118	2006-06-26	10
83	221	2006-06-26	10
83	137	2006-06-26	10
83	426	2006-06-26	10
83	123	2006-06-26	10
83	413	2006-06-26	10
83	414	2006-06-26	10
83	415	2006-06-26	10
83	416	2006-06-26	10
83	423	2006-06-26	10
83	399	2006-06-26	10
83	422	2006-06-26	10
83	56	2006-06-26	10
85	501	2006-06-26	17
85	504	2006-06-26	17
85	160	2006-06-26	17
85	156	2006-06-26	17
85	503	2006-06-26	17
85	168	2006-06-26	17
85	502	2006-06-26	17
85	180	2006-06-26	17
85	170	2006-06-26	17
85	171	2006-06-26	17
85	344	2006-06-26	17
85	694	2006-06-26	17
85	508	2006-06-26	17
87	509	2006-06-26	33
87	510	2006-06-26	33
87	511	2006-06-26	33
87	512	2006-06-26	33
87	513	2006-06-26	33
87	514	2006-06-26	33
87	515	2006-06-26	33
87	516	2006-06-26	33
87	517	2006-06-26	33
87	518	2006-06-26	33
87	520	2006-06-26	33
87	521	2006-06-26	33
87	522	2006-06-26	33
87	523	2006-06-26	33
87	524	2006-06-26	33
87	525	2006-06-26	33
87	57	2006-06-26	1
87	59	2006-06-26	33
87	526	2006-06-26	33
87	527	2006-06-26	33
87	528	2006-06-26	33
87	529	2006-06-26	33
87	532	2006-06-26	33
87	533	2006-06-26	33
87	531	2006-06-26	33
87	530	2006-06-26	33
87	534	2006-06-26	33
87	56	2006-06-26	33
87	364	2006-06-26	33
87	536	2006-06-26	33
87	537	2006-06-26	33
87	242	2006-06-26	33
87	538	2006-06-26	33
87	539	2006-06-26	33
87	563	2006-06-26	33
87	562	2006-06-26	33
87	540	2006-06-26	33
87	541	2006-06-26	33
87	542	2006-06-26	33
87	543	2006-06-26	33
87	544	2006-06-26	33
87	546	2006-06-26	33
87	547	2006-06-26	33
87	548	2006-06-26	33
87	549	2006-06-26	33
87	376	2006-06-26	33
87	551	2006-06-26	33
87	552	2006-06-26	33
87	697	2006-06-26	33
87	564	2006-06-26	10
87	554	2006-06-26	33
87	553	2006-06-26	33
87	168	2006-06-26	33
87	556	2006-06-26	33
87	557	2006-06-26	33
87	558	2006-06-26	33
87	250	2006-06-26	33
87	113	2006-06-26	33
87	383	2006-06-26	33
87	693	2006-06-26	33
87	221	2006-06-26	33
87	561	2006-06-26	33
87	560	2006-06-26	33
87	123	2006-06-26	33
88	509	2006-06-26	1
88	510	2006-06-26	1
88	511	2006-06-26	1
88	512	2006-06-26	1
88	513	2006-06-26	1
88	514	2006-06-26	1
88	515	2006-06-26	1
88	516	2006-06-26	1
88	517	2006-06-26	1
88	518	2006-06-26	1
88	520	2006-06-26	1
88	521	2006-06-26	1
88	522	2006-06-26	1
88	523	2006-06-26	1
88	524	2006-06-26	1
88	525	2006-06-26	1
88	526	2006-06-26	1
88	527	2006-06-26	1
88	528	2006-06-26	1
88	529	2006-06-26	1
88	532	2006-06-26	1
88	533	2006-06-26	1
88	531	2006-06-26	1
88	530	2006-06-26	1
88	534	2006-06-26	1
88	364	2006-06-26	1
88	536	2006-06-26	1
88	537	2006-06-26	1
88	242	2006-06-26	1
88	538	2006-06-26	1
88	539	2006-06-26	1
88	563	2006-06-26	1
88	562	2006-06-26	1
88	540	2006-06-26	1
88	541	2006-06-26	1
88	542	2006-06-26	1
88	543	2006-06-26	1
88	544	2006-06-26	1
88	546	2006-06-26	1
88	547	2006-06-26	1
88	548	2006-06-26	1
88	549	2006-06-26	1
88	376	2006-06-26	1
88	551	2006-06-26	1
88	552	2006-06-26	1
88	697	2006-06-26	1
88	564	2006-06-26	1
88	554	2006-06-26	1
88	553	2006-06-26	1
88	168	2006-06-26	1
88	556	2006-06-26	1
88	557	2006-06-26	1
88	558	2006-06-26	1
88	250	2006-06-26	1
88	113	2006-06-26	1
88	383	2006-06-26	1
88	693	2006-06-26	1
88	221	2006-06-26	1
88	561	2006-06-26	1
88	560	2006-06-26	1
88	123	2006-06-26	1
89	509	2006-06-26	1
89	510	2006-06-26	1
89	511	2006-06-26	1
89	512	2006-06-26	1
89	513	2006-06-26	1
89	514	2006-06-26	1
89	515	2006-06-26	1
89	516	2006-06-26	1
89	517	2006-06-26	1
89	518	2006-06-26	1
89	520	2006-06-26	1
89	521	2006-06-26	1
89	522	2006-06-26	1
89	523	2006-06-26	1
89	524	2006-06-26	1
89	525	2006-06-26	1
89	59	2006-06-26	1
89	526	2006-06-26	1
89	527	2006-06-26	1
89	528	2006-06-26	1
89	529	2006-06-26	1
89	532	2006-06-26	1
89	533	2006-06-26	1
89	531	2006-06-26	1
89	530	2006-06-26	1
89	534	2006-06-26	1
89	56	2006-06-26	1
89	364	2006-06-26	1
89	536	2006-06-26	1
89	537	2006-06-26	1
89	242	2006-06-26	1
89	538	2006-06-26	1
89	539	2006-06-26	1
89	563	2006-06-26	1
89	562	2006-06-26	1
89	540	2006-06-26	1
89	541	2006-06-26	1
89	542	2006-06-26	1
89	543	2006-06-26	1
89	544	2006-06-26	1
89	546	2006-06-26	1
89	547	2006-06-26	1
89	548	2006-06-26	1
89	549	2006-06-26	1
89	376	2006-06-26	1
89	551	2006-06-26	1
89	552	2006-06-26	1
89	697	2006-06-26	1
89	564	2006-06-26	1
89	554	2006-06-26	1
89	553	2006-06-26	1
89	168	2006-06-26	1
89	556	2006-06-26	1
89	557	2006-06-26	1
89	558	2006-06-26	1
89	250	2006-06-26	1
89	113	2006-06-26	1
89	383	2006-06-26	1
89	693	2006-06-26	1
89	221	2006-06-26	1
89	561	2006-06-26	1
89	560	2006-06-26	1
89	123	2006-06-26	1
90	638	2006-06-26	25
90	642	2006-06-26	25
90	630	2006-06-26	25
90	626	2006-06-26	25
90	637	2006-06-26	25
90	628	2006-06-26	25
90	639	2006-06-26	25
90	643	2006-06-26	25
90	87	2006-06-26	25
90	627	2006-06-26	25
90	405	2006-06-26	25
90	566	2006-06-26	25
90	223	2006-06-26	25
90	58	2006-06-26	25
90	673	2006-06-26	25
90	34	2006-06-26	25
90	635	2006-06-26	25
90	352	2006-06-26	25
90	81	2006-06-26	25
90	12	2006-06-26	25
90	640	2006-06-26	25
90	634	2006-06-26	25
90	629	2006-06-26	25
90	250	2006-06-26	25
90	645	2006-06-26	25
90	616	2006-06-26	25
90	631	2006-06-26	25
90	632	2006-06-26	25
90	633	2006-06-26	25
90	113	2006-06-26	25
90	116	2006-06-26	25
90	221	2006-06-26	25
90	636	2006-06-26	25
90	641	2006-06-26	25
90	644	2006-06-26	25
90	646	2006-06-26	25
90	4	2006-06-26	25
79	100	2006-06-22	26
79	340	2006-06-22	26
79	145	2006-06-22	26
79	106	2006-06-27	26
79	591	2006-06-27	26
79	592	2006-06-27	26
79	148	2006-06-26	26
79	690	2006-06-22	26
79	343	2006-06-27	26
79	143	2006-06-22	26
79	311	2006-06-22	2
79	129	2006-06-22	26
79	593	2006-06-27	26
79	105	2006-06-27	26
79	314	2006-06-26	26
79	594	2006-06-27	26
79	595	2006-06-27	26
79	596	2006-06-27	26
79	113	2006-06-26	26
79	116	2006-06-26	26
79	597	2006-06-27	26
79	598	2006-06-27	26
79	599	2006-06-27	26
79	344	2006-06-27	26
79	600	2006-06-27	26
79	123	2006-06-22	26
79	601	2006-06-27	26
79	602	2006-06-27	26
79	604	2006-06-27	26
79	603	2006-06-27	26
91	60	2006-06-27	49
91	61	2006-06-27	49
91	155	2006-06-27	11
91	694	2006-06-27	11
91	340	2006-06-27	38
91	145	2006-06-27	38
91	670	2006-06-27	38
91	143	2006-06-27	50
91	699	2006-06-27	1
91	71	2006-06-27	49
91	703	2006-06-27	49
91	299	2006-06-27	38
91	673	2006-06-27	38
91	168	2006-06-27	11
91	12	2006-06-27	38
91	129	2006-06-27	38
91	313	2006-06-27	38
91	113	2006-06-27	38
91	116	2006-06-27	38
91	119	2006-06-27	38
91	20	2006-06-27	38
91	123	2006-06-27	38
91	316	2006-06-27	38
91	704	2006-06-27	11
92	60	2006-06-27	12
92	61	2006-06-27	12
92	340	2006-06-27	12
92	145	2006-06-27	12
92	143	2006-06-27	12
92	71	2006-06-27	12
92	703	2006-06-27	12
92	299	2006-06-27	12
92	673	2006-06-27	12
92	12	2006-06-27	12
92	129	2006-06-27	12
92	313	2006-06-27	12
92	113	2006-06-27	12
92	116	2006-06-27	12
92	119	2006-06-27	12
92	20	2006-06-27	12
92	123	2006-06-27	12
92	316	2006-06-27	12
91	706	2006-06-27	11
93	424	2006-06-27	4
93	67	2006-06-27	4
93	417	2006-06-27	4
93	418	2006-06-27	4
93	101	2006-06-27	4
93	102	2006-06-27	4
93	419	2006-06-27	4
93	24	2006-06-27	4
93	439	2006-06-27	4
93	4	2006-06-27	4
93	427	2006-06-27	4
93	71	2006-06-27	4
93	26	2006-06-27	4
93	33	2006-06-27	4
93	27	2006-06-27	4
93	73	2006-06-27	4
93	436	2006-06-27	4
93	420	2006-06-27	4
93	421	2006-06-27	4
93	151	2006-06-27	4
93	442	2006-06-27	4
93	152	2006-06-27	4
93	143	2006-06-27	4
93	75	2006-06-27	4
93	76	2006-06-27	4
93	153	2006-06-27	4
93	706	2006-06-27	4
93	34	2006-06-27	4
93	444	2006-06-27	4
93	81	2006-06-27	4
93	681	2006-06-27	4
93	28	2006-06-27	4
93	84	2006-06-27	4
93	136	2006-06-27	4
93	96	2006-06-27	4
93	137	2006-06-27	4
93	413	2006-06-27	4
93	414	2006-06-27	4
93	415	2006-06-27	4
93	416	2006-06-27	4
93	423	2006-06-27	4
93	422	2006-06-27	4
93	56	2006-06-27	4
93	707	2006-06-27	4
93	568	2006-06-27	4
93	360	2006-06-27	4
93	570	2006-06-27	4
93	571	2006-06-27	4
93	565	2006-06-27	4
93	566	2006-06-27	4
93	572	2006-06-27	4
93	569	2006-06-27	4
93	141	2006-06-27	4
93	49	2006-06-27	4
93	51	2006-06-27	4
93	690	2006-06-27	4
93	709	2006-06-27	4
93	573	2006-06-27	4
93	299	2006-06-27	4
93	52	2006-06-27	4
93	54	2006-06-27	4
93	12	2006-06-27	4
93	250	2006-06-27	4
93	114	2006-06-27	4
93	117	2006-06-27	4
93	120	2006-06-27	4
93	123	2006-06-27	4
93	574	2006-06-27	1
93	710	2006-06-27	4
94	587	2006-06-27	4
94	575	2006-06-27	13
94	588	2006-06-27	13
94	590	2006-06-27	4
95	577	2006-06-27	9
95	252	2006-06-27	9
95	49	2006-06-27	9
95	436	2006-06-27	9
95	578	2006-06-27	9
95	586	2006-06-27	9
95	143	2006-06-27	9
95	566	2006-06-27	9
95	183	2006-06-27	9
95	58	2006-06-27	9
95	12	2006-06-27	9
95	576	2006-06-27	9
95	131	2006-06-27	9
95	572	2006-06-27	9
95	114	2006-06-27	9
95	117	2006-06-27	9
95	119	2006-06-27	9
95	123	2006-06-27	9
95	56	2006-06-27	9
95	712	2006-06-27	9
96	577	2006-06-27	10
96	252	2006-06-27	10
96	49	2006-06-27	10
96	578	2006-06-27	10
96	143	2006-06-27	10
96	183	2006-06-27	10
96	58	2006-06-27	10
96	12	2006-06-27	10
96	576	2006-06-27	10
96	131	2006-06-27	10
96	114	2006-06-27	10
96	117	2006-06-27	10
96	119	2006-06-27	10
96	123	2006-06-27	10
96	56	2006-06-27	10
96	712	2006-06-27	10
97	577	2006-06-27	7
97	578	2006-06-27	7
97	566	2006-06-27	7
97	58	2006-06-27	7
97	576	2006-06-27	7
97	572	2006-06-27	7
97	580	2006-06-27	7
97	56	2006-06-27	7
98	577	2006-06-27	7
98	252	2006-06-27	7
98	49	2006-06-27	7
98	578	2006-06-27	7
98	143	2006-06-27	7
98	183	2006-06-27	7
98	58	2006-06-27	7
98	12	2006-06-27	7
98	576	2006-06-27	7
98	131	2006-06-27	7
98	114	2006-06-27	7
98	117	2006-06-27	7
98	119	2006-06-27	7
98	123	2006-06-27	7
98	56	2006-06-27	7
98	712	2006-06-27	7
99	577	2006-06-27	7
99	252	2006-06-27	7
99	49	2006-06-27	7
99	578	2006-06-27	7
99	143	2006-06-27	7
99	183	2006-06-27	7
99	58	2006-06-27	7
99	12	2006-06-27	7
99	576	2006-06-27	7
99	131	2006-06-27	7
99	114	2006-06-27	7
99	117	2006-06-27	7
99	119	2006-06-27	7
99	123	2006-06-27	7
99	56	2006-06-27	7
99	712	2006-06-27	7
100	577	2006-06-27	10
100	252	2006-06-27	10
100	49	2006-06-27	10
100	578	2006-06-27	10
100	143	2006-06-27	10
100	183	2006-06-27	10
100	58	2006-06-27	10
100	12	2006-06-27	10
100	576	2006-06-27	10
100	131	2006-06-27	10
100	114	2006-06-27	10
100	117	2006-06-27	10
100	119	2006-06-27	10
100	123	2006-06-27	10
100	56	2006-06-27	10
100	563	2006-06-27	10
100	360	2006-06-27	10
101	100	2006-06-27	1
101	340	2006-06-27	1
101	101	2006-06-27	1
101	102	2006-06-27	1
101	145	2006-06-27	1
101	141	2006-06-27	1
101	24	2006-06-27	1
101	305	2006-06-27	1
101	26	2006-06-27	1
101	33	2006-06-27	1
101	27	2006-06-27	1
101	73	2006-06-27	1
101	299	2006-06-27	1
101	1	2006-06-27	1
101	58	2006-06-27	1
101	34	2006-06-27	1
101	323	2006-06-27	1
101	12	2006-06-27	1
101	313	2006-06-27	1
101	114	2006-06-27	1
101	28	2006-06-27	1
101	17	2006-06-27	1
101	84	2006-06-27	1
101	119	2006-06-27	1
101	20	2006-06-27	1
101	123	2006-06-27	1
101	31	2006-06-27	1
101	32	2006-06-27	1
101	316	2006-06-27	1
101	56	2006-06-27	1
101	714	2006-06-27	1
102	100	2006-06-27	1
102	340	2006-06-27	1
102	101	2006-06-27	1
102	102	2006-06-27	1
102	145	2006-06-27	1
102	141	2006-06-27	1
102	24	2006-06-27	1
102	305	2006-06-27	1
102	26	2006-06-27	1
102	33	2006-06-27	1
102	27	2006-06-27	1
102	73	2006-06-27	1
102	299	2006-06-27	1
102	1	2006-06-27	1
102	58	2006-06-27	1
102	34	2006-06-27	1
102	323	2006-06-27	1
102	12	2006-06-27	1
102	313	2006-06-27	1
102	114	2006-06-27	1
102	28	2006-06-27	1
102	17	2006-06-27	1
102	84	2006-06-27	1
102	119	2006-06-27	1
102	20	2006-06-27	1
102	123	2006-06-27	1
102	31	2006-06-27	1
102	32	2006-06-27	1
102	316	2006-06-27	1
102	56	2006-06-27	1
102	714	2006-06-27	1
103	100	2006-06-27	1
103	340	2006-06-27	1
103	101	2006-06-27	1
103	102	2006-06-27	1
103	145	2006-06-27	1
103	141	2006-06-27	1
103	24	2006-06-27	1
103	305	2006-06-27	1
103	26	2006-06-27	1
103	33	2006-06-27	1
103	27	2006-06-27	1
103	73	2006-06-27	1
103	299	2006-06-27	1
103	1	2006-06-27	1
103	58	2006-06-27	1
103	34	2006-06-27	1
103	323	2006-06-27	1
103	12	2006-06-27	1
103	313	2006-06-27	1
103	114	2006-06-27	1
103	28	2006-06-27	1
103	17	2006-06-27	1
103	84	2006-06-27	1
103	119	2006-06-27	1
103	20	2006-06-27	1
103	123	2006-06-27	1
103	31	2006-06-27	1
103	32	2006-06-27	1
103	316	2006-06-27	1
103	56	2006-06-27	1
103	714	2006-06-27	1
104	100	2006-06-27	1
104	340	2006-06-27	1
104	101	2006-06-27	1
104	102	2006-06-27	1
104	145	2006-06-27	1
104	141	2006-06-27	1
104	24	2006-06-27	1
104	305	2006-06-27	1
104	26	2006-06-27	1
104	33	2006-06-27	1
104	27	2006-06-27	1
104	73	2006-06-27	1
104	299	2006-06-27	1
104	1	2006-06-27	1
104	58	2006-06-27	1
104	34	2006-06-27	1
104	323	2006-06-27	1
104	12	2006-06-27	1
104	313	2006-06-27	1
104	114	2006-06-27	1
104	28	2006-06-27	1
104	17	2006-06-27	1
104	84	2006-06-27	1
104	119	2006-06-27	1
104	20	2006-06-27	1
104	123	2006-06-27	1
104	31	2006-06-27	1
104	32	2006-06-27	1
104	316	2006-06-27	1
104	56	2006-06-27	1
104	714	2006-06-27	1
105	100	2006-06-27	1
105	340	2006-06-27	1
105	101	2006-06-27	1
105	102	2006-06-27	1
105	145	2006-06-27	1
105	141	2006-06-27	1
105	24	2006-06-27	1
105	305	2006-06-27	1
105	26	2006-06-27	1
105	33	2006-06-27	1
105	27	2006-06-27	1
105	73	2006-06-27	1
105	299	2006-06-27	1
105	1	2006-06-27	1
105	58	2006-06-27	1
105	34	2006-06-27	1
105	323	2006-06-27	1
105	12	2006-06-27	1
105	313	2006-06-27	1
105	114	2006-06-27	1
105	28	2006-06-27	1
105	17	2006-06-27	1
105	84	2006-06-27	1
105	119	2006-06-27	1
105	20	2006-06-27	1
105	123	2006-06-27	1
105	31	2006-06-27	1
105	32	2006-06-27	1
105	316	2006-06-27	1
105	56	2006-06-27	1
105	714	2006-06-27	1
109	100	2006-06-27	1
109	340	2006-06-27	1
109	101	2006-06-27	1
109	102	2006-06-27	1
109	145	2006-06-27	1
109	141	2006-06-27	1
109	24	2006-06-27	1
109	305	2006-06-27	1
109	26	2006-06-27	1
109	33	2006-06-27	1
109	27	2006-06-27	1
109	73	2006-06-27	1
109	299	2006-06-27	1
109	1	2006-06-27	1
109	58	2006-06-27	1
109	34	2006-06-27	1
109	323	2006-06-27	1
109	12	2006-06-27	1
109	313	2006-06-27	1
109	114	2006-06-27	1
109	28	2006-06-27	1
109	17	2006-06-27	1
109	84	2006-06-27	1
109	119	2006-06-27	1
109	20	2006-06-27	1
109	123	2006-06-27	1
109	31	2006-06-27	1
109	32	2006-06-27	1
109	316	2006-06-27	1
109	56	2006-06-27	1
109	714	2006-06-27	1
110	100	2006-06-27	1
110	340	2006-06-27	1
110	101	2006-06-27	1
110	102	2006-06-27	1
110	145	2006-06-27	1
110	141	2006-06-27	1
110	24	2006-06-27	1
110	305	2006-06-27	1
110	26	2006-06-27	1
110	33	2006-06-27	1
110	27	2006-06-27	1
110	73	2006-06-27	1
110	299	2006-06-27	1
110	1	2006-06-27	1
110	58	2006-06-27	1
110	34	2006-06-27	1
110	323	2006-06-27	1
110	12	2006-06-27	1
110	313	2006-06-27	1
110	114	2006-06-27	1
110	28	2006-06-27	1
110	17	2006-06-27	1
110	84	2006-06-27	1
110	119	2006-06-27	1
110	20	2006-06-27	1
110	123	2006-06-27	1
110	31	2006-06-27	1
110	32	2006-06-27	1
110	316	2006-06-27	1
110	56	2006-06-27	1
110	714	2006-06-27	1
111	100	2006-06-27	2
111	340	2006-06-27	2
111	101	2006-06-27	2
111	102	2006-06-27	2
111	145	2006-06-27	2
111	24	2006-06-27	2
111	305	2006-06-27	2
111	26	2006-06-27	2
111	33	2006-06-27	2
111	27	2006-06-27	2
111	73	2006-06-27	2
111	299	2006-06-27	2
111	1	2006-06-27	2
111	58	2006-06-27	2
111	34	2006-06-27	2
111	323	2006-06-27	2
111	12	2006-06-27	2
111	313	2006-06-27	2
111	114	2006-06-27	2
111	28	2006-06-27	2
111	17	2006-06-27	2
111	84	2006-06-27	2
111	119	2006-06-27	2
111	123	2006-06-27	2
111	31	2006-06-27	2
111	32	2006-06-27	2
111	56	2006-06-27	2
111	714	2006-06-27	2
111	304	2006-06-27	2
111	106	2006-06-27	2
111	690	2006-06-27	2
111	16	2006-06-27	2
111	689	2006-06-27	2
112	100	2006-06-27	1
112	340	2006-06-27	1
112	101	2006-06-27	1
112	102	2006-06-27	1
112	145	2006-06-27	1
112	24	2006-06-27	1
112	305	2006-06-27	1
112	26	2006-06-27	1
112	33	2006-06-27	1
112	27	2006-06-27	1
112	299	2006-06-27	1
112	1	2006-06-27	1
112	58	2006-06-27	1
112	12	2006-06-27	1
112	313	2006-06-27	1
112	114	2006-06-27	1
112	28	2006-06-27	1
112	17	2006-06-27	1
112	119	2006-06-27	1
112	123	2006-06-27	1
112	31	2006-06-27	1
112	32	2006-06-27	1
112	56	2006-06-27	1
112	714	2006-06-27	1
112	304	2006-06-27	1
112	106	2006-06-27	1
112	605	2006-06-27	1
112	6	2006-06-27	1
112	25	2006-06-27	1
112	607	2006-06-27	1
112	303	2006-06-27	1
112	609	2006-06-27	1
112	691	2006-06-27	1
112	690	2006-06-27	1
112	142	2006-06-27	1
112	129	2006-06-27	1
112	689	2006-06-27	1
112	715	2006-06-27	1
113	100	2006-06-27	1
113	340	2006-06-27	1
113	145	2006-06-27	1
113	26	2006-06-27	1
113	299	2006-06-27	1
113	1	2006-06-27	1
113	58	2006-06-27	1
113	12	2006-06-27	1
113	123	2006-06-27	1
113	56	2006-06-27	1
113	714	2006-06-27	1
113	304	2006-06-27	1
113	106	2006-06-27	1
113	691	2006-06-27	1
113	690	2006-06-27	1
113	129	2006-06-27	1
113	148	2006-06-27	1
113	314	2006-06-27	1
113	113	2006-06-27	1
113	16	2006-06-27	1
113	116	2006-06-27	1
113	315	2006-06-27	1
113	20	2006-06-27	1
114	100	2006-06-27	2
114	340	2006-06-27	2
114	101	2006-06-27	2
114	102	2006-06-27	2
114	145	2006-06-27	2
114	24	2006-06-27	2
114	305	2006-06-27	2
114	26	2006-06-27	2
114	33	2006-06-27	2
114	27	2006-06-27	2
114	299	2006-06-27	2
114	1	2006-06-27	2
114	58	2006-06-27	2
114	12	2006-06-27	2
114	313	2006-06-27	2
114	114	2006-06-27	2
114	28	2006-06-27	2
114	17	2006-06-27	2
114	119	2006-06-27	2
114	123	2006-06-27	2
114	31	2006-06-27	2
114	32	2006-06-27	2
114	56	2006-06-27	2
114	714	2006-06-27	2
114	304	2006-06-27	2
114	106	2006-06-27	2
114	605	2006-06-27	2
114	6	2006-06-27	2
114	25	2006-06-27	2
114	607	2006-06-27	2
114	303	2006-06-27	2
114	609	2006-06-27	2
114	691	2006-06-27	2
114	690	2006-06-27	2
114	142	2006-06-27	2
114	129	2006-06-27	2
114	689	2006-06-27	2
114	715	2006-06-27	2
115	100	2006-06-27	1
115	340	2006-06-27	1
115	101	2006-06-27	1
115	102	2006-06-27	1
115	145	2006-06-27	1
115	24	2006-06-27	1
115	26	2006-06-27	1
115	33	2006-06-27	1
115	27	2006-06-27	1
115	299	2006-06-27	1
115	1	2006-06-27	1
115	58	2006-06-27	1
115	12	2006-06-27	1
115	28	2006-06-27	1
115	123	2006-06-27	1
115	31	2006-06-27	1
115	32	2006-06-27	1
115	56	2006-06-27	1
115	714	2006-06-27	1
115	304	2006-06-27	1
115	106	2006-06-27	1
115	691	2006-06-27	1
115	690	2006-06-27	1
115	129	2006-06-27	1
115	73	2006-06-27	1
115	34	2006-06-27	1
115	323	2006-06-27	1
115	84	2006-06-27	1
115	314	2006-06-27	1
115	113	2006-06-27	1
115	16	2006-06-27	1
115	116	2006-06-27	1
115	315	2006-06-27	1
115	20	2006-06-27	1
116	2	2006-06-28	1
116	577	2006-06-28	1
116	49	2006-06-28	1
116	360	2006-06-28	1
116	254	2006-06-28	1
116	578	2006-06-28	1
116	714	2006-06-28	1
116	255	2006-06-28	1
116	183	2006-06-28	1
116	1	2006-06-28	1
116	58	2006-06-28	1
116	673	2006-06-28	1
116	257	2006-06-28	1
116	12	2006-06-28	1
116	576	2006-06-28	1
116	620	2006-06-28	1
116	113	2006-06-28	1
116	116	2006-06-28	1
116	18	2006-06-28	1
116	20	2006-06-28	1
116	21	2006-06-28	1
116	56	2006-06-28	1
116	717	2006-06-28	1
117	2	2006-06-28	1
117	577	2006-06-28	1
117	49	2006-06-28	1
117	360	2006-06-28	1
117	254	2006-06-28	1
117	578	2006-06-28	1
117	714	2006-06-28	1
117	255	2006-06-28	1
117	183	2006-06-28	1
117	1	2006-06-28	1
117	58	2006-06-28	1
117	673	2006-06-28	1
117	257	2006-06-28	1
117	12	2006-06-28	1
117	576	2006-06-28	1
117	620	2006-06-28	1
117	113	2006-06-28	1
117	116	2006-06-28	1
117	18	2006-06-28	1
117	20	2006-06-28	1
117	21	2006-06-28	1
117	56	2006-06-28	1
117	717	2006-06-28	1
118	2	2006-06-28	1
118	577	2006-06-28	1
118	49	2006-06-28	1
118	360	2006-06-28	1
118	254	2006-06-28	1
118	578	2006-06-28	1
118	714	2006-06-28	1
118	255	2006-06-28	1
118	183	2006-06-28	1
118	1	2006-06-28	1
118	58	2006-06-28	1
118	673	2006-06-28	1
118	257	2006-06-28	1
118	12	2006-06-28	1
118	576	2006-06-28	1
118	620	2006-06-28	1
118	113	2006-06-28	1
118	116	2006-06-28	1
118	18	2006-06-28	1
118	20	2006-06-28	1
118	21	2006-06-28	1
118	56	2006-06-28	1
118	717	2006-06-28	1
119	2	2006-06-28	1
119	577	2006-06-28	1
119	49	2006-06-28	1
119	360	2006-06-28	1
119	254	2006-06-28	1
119	578	2006-06-28	1
119	714	2006-06-28	1
119	255	2006-06-28	1
119	183	2006-06-28	1
119	1	2006-06-28	1
119	58	2006-06-28	1
119	673	2006-06-28	1
119	257	2006-06-28	1
119	12	2006-06-28	1
119	576	2006-06-28	1
119	620	2006-06-28	1
119	113	2006-06-28	1
119	116	2006-06-28	1
119	18	2006-06-28	1
119	20	2006-06-28	1
119	21	2006-06-28	1
119	56	2006-06-28	1
119	717	2006-06-28	1
120	2	2006-06-28	1
120	577	2006-06-28	1
120	49	2006-06-28	1
120	360	2006-06-28	1
120	254	2006-06-28	1
120	578	2006-06-28	1
120	714	2006-06-28	1
120	255	2006-06-28	1
120	183	2006-06-28	1
120	1	2006-06-28	1
120	58	2006-06-28	1
120	673	2006-06-28	1
120	257	2006-06-28	1
120	12	2006-06-28	1
120	576	2006-06-28	1
120	620	2006-06-28	1
120	113	2006-06-28	1
120	116	2006-06-28	1
120	18	2006-06-28	1
120	20	2006-06-28	1
120	21	2006-06-28	1
120	56	2006-06-28	1
120	717	2006-06-28	1
121	2	2006-06-28	1
121	577	2006-06-28	1
121	49	2006-06-28	1
121	360	2006-06-28	1
121	254	2006-06-28	1
121	578	2006-06-28	1
121	714	2006-06-28	1
121	255	2006-06-28	1
121	183	2006-06-28	1
121	1	2006-06-28	1
121	58	2006-06-28	1
121	673	2006-06-28	1
121	257	2006-06-28	1
121	12	2006-06-28	1
121	576	2006-06-28	1
121	620	2006-06-28	1
121	113	2006-06-28	1
121	116	2006-06-28	1
121	18	2006-06-28	1
121	20	2006-06-28	1
121	21	2006-06-28	1
121	56	2006-06-28	1
121	717	2006-06-28	1
122	2	2006-06-28	1
122	577	2006-06-28	1
122	49	2006-06-28	1
122	360	2006-06-28	1
122	254	2006-06-28	1
122	578	2006-06-28	1
122	714	2006-06-28	1
122	255	2006-06-28	1
122	183	2006-06-28	1
122	1	2006-06-28	1
122	58	2006-06-28	1
122	673	2006-06-28	1
122	257	2006-06-28	1
122	12	2006-06-28	1
122	576	2006-06-28	1
122	620	2006-06-28	1
122	113	2006-06-28	1
122	116	2006-06-28	1
122	18	2006-06-28	1
122	20	2006-06-28	1
122	21	2006-06-28	1
122	56	2006-06-28	1
122	717	2006-06-28	1
123	2	2006-06-28	1
123	577	2006-06-28	1
123	49	2006-06-28	1
123	360	2006-06-28	1
123	254	2006-06-28	1
123	578	2006-06-28	1
123	714	2006-06-28	1
123	255	2006-06-28	1
123	183	2006-06-28	1
123	1	2006-06-28	1
123	58	2006-06-28	1
123	673	2006-06-28	1
123	257	2006-06-28	1
123	12	2006-06-28	1
123	576	2006-06-28	1
123	620	2006-06-28	1
123	113	2006-06-28	1
123	116	2006-06-28	1
123	18	2006-06-28	1
123	20	2006-06-28	1
123	21	2006-06-28	1
123	56	2006-06-28	1
123	717	2006-06-28	1
124	2	2006-06-28	1
124	577	2006-06-28	1
124	49	2006-06-28	1
124	360	2006-06-28	1
124	254	2006-06-28	1
124	578	2006-06-28	1
124	714	2006-06-28	1
124	255	2006-06-28	1
124	183	2006-06-28	1
124	1	2006-06-28	1
124	58	2006-06-28	1
124	673	2006-06-28	1
124	257	2006-06-28	1
124	12	2006-06-28	1
124	576	2006-06-28	1
124	620	2006-06-28	1
124	113	2006-06-28	1
124	116	2006-06-28	1
124	18	2006-06-28	1
124	20	2006-06-28	1
124	21	2006-06-28	1
124	56	2006-06-28	1
124	717	2006-06-28	1
125	2	2006-06-28	1
125	577	2006-06-28	1
125	49	2006-06-28	1
125	360	2006-06-28	1
125	254	2006-06-28	1
125	578	2006-06-28	1
125	714	2006-06-28	1
125	255	2006-06-28	1
125	183	2006-06-28	1
125	1	2006-06-28	1
125	58	2006-06-28	1
125	673	2006-06-28	1
125	257	2006-06-28	1
125	12	2006-06-28	1
125	576	2006-06-28	1
125	620	2006-06-28	1
125	113	2006-06-28	1
125	116	2006-06-28	1
125	18	2006-06-28	1
125	20	2006-06-28	1
125	21	2006-06-28	1
125	56	2006-06-28	1
125	717	2006-06-28	1
126	2	2006-06-28	1
126	577	2006-06-28	1
126	49	2006-06-28	1
126	360	2006-06-28	1
126	254	2006-06-28	1
126	578	2006-06-28	1
126	714	2006-06-28	1
126	255	2006-06-28	1
126	183	2006-06-28	1
126	1	2006-06-28	1
126	58	2006-06-28	1
126	673	2006-06-28	1
126	257	2006-06-28	1
126	12	2006-06-28	1
126	576	2006-06-28	1
126	620	2006-06-28	1
126	113	2006-06-28	1
126	116	2006-06-28	1
126	18	2006-06-28	1
126	20	2006-06-28	1
126	21	2006-06-28	1
126	56	2006-06-28	1
126	717	2006-06-28	1
127	2	2006-06-28	1
127	577	2006-06-28	1
127	49	2006-06-28	1
127	360	2006-06-28	1
127	254	2006-06-28	1
127	578	2006-06-28	1
127	714	2006-06-28	1
127	255	2006-06-28	1
127	183	2006-06-28	1
127	1	2006-06-28	1
127	58	2006-06-28	1
127	673	2006-06-28	1
127	257	2006-06-28	1
127	576	2006-06-28	1
127	620	2006-06-28	1
127	113	2006-06-28	1
127	116	2006-06-28	1
127	18	2006-06-28	1
127	20	2006-06-28	1
127	21	2006-06-28	1
127	56	2006-06-28	1
127	717	2006-06-28	1
128	2	2006-06-28	1
128	577	2006-06-28	1
128	49	2006-06-28	1
128	360	2006-06-28	1
128	254	2006-06-28	1
128	578	2006-06-28	1
128	714	2006-06-28	1
128	255	2006-06-28	1
128	183	2006-06-28	1
128	1	2006-06-28	1
128	58	2006-06-28	1
128	673	2006-06-28	1
128	257	2006-06-28	1
128	576	2006-06-28	1
128	620	2006-06-28	1
128	113	2006-06-28	1
128	116	2006-06-28	1
128	18	2006-06-28	1
128	20	2006-06-28	1
128	21	2006-06-28	1
128	56	2006-06-28	1
128	717	2006-06-28	1
129	2	2006-06-28	1
129	577	2006-06-28	1
129	49	2006-06-28	1
129	360	2006-06-28	1
129	254	2006-06-28	1
129	578	2006-06-28	1
129	714	2006-06-28	1
129	255	2006-06-28	1
129	183	2006-06-28	1
129	1	2006-06-28	1
129	58	2006-06-28	1
129	673	2006-06-28	1
129	257	2006-06-28	1
129	576	2006-06-28	1
129	620	2006-06-28	1
129	113	2006-06-28	1
129	116	2006-06-28	1
129	18	2006-06-28	1
129	20	2006-06-28	1
129	21	2006-06-28	1
129	56	2006-06-28	1
129	717	2006-06-28	1
129	621	2006-06-28	1
129	618	2006-06-28	1
129	622	2006-06-28	1
131	351	2006-06-28	24
131	405	2006-06-28	25
131	56	2006-06-28	25
84	354	2006-06-28	4
84	355	2006-06-28	4
84	360	2006-06-28	4
84	361	2006-06-28	4
84	356	2006-06-28	1
84	362	2006-06-28	4
84	363	2006-06-28	4
84	58	2006-06-28	4
84	357	2006-06-28	4
84	358	2006-06-28	4
84	56	2006-06-28	4
84	364	2006-06-28	4
84	365	2006-06-28	4
84	366	2006-06-28	4
84	367	2006-06-28	4
84	368	2006-06-28	4
84	369	2006-06-28	4
84	370	2006-06-28	4
84	371	2006-06-28	4
84	372	2006-06-28	4
84	373	2006-06-28	4
84	376	2006-06-28	4
84	377	2006-06-28	4
84	374	2006-06-28	4
84	375	2006-06-28	4
84	378	2006-06-28	4
84	379	2006-06-28	4
84	380	2006-06-28	4
84	381	2006-06-28	4
84	382	2006-06-28	4
84	383	2006-06-28	4
84	384	2006-06-28	4
84	385	2006-06-28	4
84	386	2006-06-28	4
84	387	2006-06-28	4
84	391	2006-06-28	4
84	388	2006-06-28	4
84	389	2006-06-28	4
84	398	2006-06-28	4
84	392	2006-06-28	4
84	394	2006-06-28	4
84	395	2006-06-28	4
84	396	2006-06-28	4
84	397	2006-06-28	4
84	390	2006-06-28	4
84	429	2006-06-28	4
84	428	2006-06-28	4
84	430	2006-06-28	4
84	435	2006-06-28	4
84	408	2006-06-28	4
84	75	2006-06-28	4
84	425	2006-06-28	4
84	431	2006-06-28	4
84	432	2006-06-28	4
84	433	2006-06-28	4
84	434	2006-06-28	4
84	400	2006-06-28	4
84	409	2006-06-28	4
84	426	2006-06-28	4
84	476	2006-06-28	4
84	454	2006-06-28	4
84	455	2006-06-28	4
84	456	2006-06-28	4
84	457	2006-06-28	4
84	448	2006-06-28	4
84	449	2006-06-28	4
84	450	2006-06-28	4
84	451	2006-06-28	4
84	436	2006-06-28	4
84	479	2006-06-28	4
84	393	2006-06-28	4
84	474	2006-06-28	4
84	458	2006-06-28	4
84	459	2006-06-28	4
84	452	2006-06-28	4
84	453	2006-06-28	4
84	460	2006-06-28	4
84	470	2006-06-28	4
84	463	2006-06-28	4
84	465	2006-06-28	4
84	466	2006-06-28	4
84	467	2006-06-28	4
84	469	2006-06-28	4
84	461	2006-06-28	4
84	475	2006-06-28	4
84	478	2006-06-28	4
84	477	2006-06-28	4
84	462	2006-06-28	4
84	179	2006-06-28	4
84	12	2006-06-28	4
84	493	2006-06-28	4
84	181	2006-06-28	4
84	655	2006-06-28	4
84	16	2006-06-28	4
84	344	2006-06-28	14
84	123	2006-06-28	4
84	182	2006-06-28	4
84	113	2006-06-28	4
84	719	2006-06-28	4
133	485	2006-06-28	10
133	405	2006-06-28	10
133	58	2006-06-28	10
133	352	2006-06-28	10
133	56	2006-06-28	10
133	12	2006-06-28	10
133	104	2006-06-28	10
133	16	2006-06-28	10
133	693	2006-06-28	10
133	221	2006-06-28	10
133	123	2006-06-28	10
133	721	2006-06-28	10
134	495	2006-06-28	3
134	405	2006-06-28	3
134	492	2006-06-28	3
134	58	2006-06-28	3
134	300	2006-06-28	3
134	349	2006-06-28	1
134	721	2006-06-28	3
134	16	2006-06-28	3
134	693	2006-06-28	3
134	123	2006-06-28	3
134	56	2006-06-28	3
134	350	2006-06-28	3
135	351	2006-06-28	2
135	483	2006-06-28	2
135	406	2006-06-28	2
135	58	2006-06-28	2
135	12	2006-06-28	2
135	493	2006-06-28	2
135	16	2006-06-28	2
135	693	2006-06-28	2
135	56	2006-06-28	2
136	424	2006-06-28	1
136	417	2006-06-28	1
136	418	2006-06-28	1
136	101	2006-06-28	1
136	102	2006-06-28	1
136	437	2006-06-28	1
136	438	2006-06-28	1
136	419	2006-06-28	1
136	439	2006-06-28	1
136	440	2006-06-28	1
136	427	2006-06-28	1
136	26	2006-06-28	1
136	33	2006-06-28	1
136	27	2006-06-28	1
136	73	2006-06-28	1
136	360	2006-06-28	1
136	436	2006-06-28	1
136	420	2006-06-28	1
136	421	2006-06-28	1
136	441	2006-06-28	1
136	152	2006-06-28	1
136	75	2006-06-28	1
136	443	2006-06-28	1
136	58	2006-06-28	1
136	444	2006-06-28	1
136	352	2006-06-28	1
136	81	2006-06-28	1
136	338	2006-06-28	1
136	28	2006-06-28	1
136	118	2006-06-28	1
136	137	2006-06-28	1
136	413	2006-06-28	1
136	414	2006-06-28	1
136	415	2006-06-28	1
136	416	2006-06-28	1
136	423	2006-06-28	1
136	580	2006-06-28	1
136	422	2006-06-28	1
136	56	2006-06-28	1
136	408	2006-06-28	1
136	405	2006-06-28	1
136	487	2006-06-28	1
136	488	2006-06-28	1
136	490	2006-06-28	1
136	493	2006-06-28	1
136	104	2006-06-28	1
136	301	2006-06-28	1
136	181	2006-06-28	1
136	16	2006-06-28	1
136	496	2006-06-28	1
136	719	2006-06-28	1
136	344	2006-06-28	1
136	221	2006-06-28	1
136	123	2006-06-28	1
44	722	2006-07-17	20
34	65	2006-06-19	61
34	100	2006-06-19	61
34	67	2006-06-19	61
34	62	2006-06-19	8
34	101	2006-06-19	61
34	102	2006-06-19	61
34	145	2006-06-19	61
34	63	2006-06-19	4
34	141	2006-06-19	61
34	69	2006-06-19	61
34	106	2006-06-19	61
34	146	2006-06-19	61
34	637	2006-06-19	61
34	24	2006-06-19	61
34	70	2006-06-19	61
34	670	2006-06-19	61
34	305	2006-06-19	61
34	439	2006-06-19	61
34	4	2006-06-19	51
34	427	2006-06-19	61
34	87	2006-06-19	20
34	98	2006-06-19	61
34	49	2006-06-19	61
34	320	2006-06-19	61
34	88	2006-06-19	20
34	90	2006-06-19	20
34	91	2006-06-19	20
34	26	2006-06-19	61
34	33	2006-06-19	61
34	27	2006-06-19	61
34	73	2006-06-19	61
34	107	2006-06-19	61
34	92	2006-06-19	20
34	669	2006-06-19	61
34	148	2006-06-19	61
34	151	2006-06-19	61
34	442	2006-06-19	61
34	152	2006-06-19	61
34	143	2006-06-19	61
34	74	2006-06-19	61
34	75	2006-06-19	61
34	76	2006-06-19	61
34	77	2006-06-19	20
34	443	2006-06-19	61
34	52	2006-06-19	61
34	60	2006-06-19	61
34	61	2006-06-19	61
34	673	2006-06-19	61
34	157	2006-06-19	61
34	34	2006-06-19	61
34	133	2006-06-19	61
34	54	2006-06-19	61
34	352	2006-06-19	61
34	81	2006-06-19	61
34	12	2006-06-19	61
34	508	2006-06-19	61
34	129	2006-06-19	61
34	105	2006-06-19	6
34	313	2006-06-19	61
34	108	2006-06-19	61
34	83	2006-06-19	61
34	616	2006-06-19	61
34	111	2006-06-19	61
34	110	2006-06-19	61
34	109	2006-06-19	61
34	99	2006-06-19	4
34	115	2006-06-19	61
34	16	2006-06-19	61
34	28	2006-06-19	61
34	117	2006-06-19	61
34	85	2006-06-19	61
34	118	2006-06-19	61
34	119	2006-06-19	61
34	96	2006-06-19	61
34	120	2006-06-19	61
34	137	2006-06-19	61
34	86	2006-06-19	20
34	123	2006-06-19	61
34	31	2006-06-19	61
34	32	2006-06-19	61
34	126	2006-06-19	61
34	112	2006-06-19	61
34	64	2006-06-19	4
34	56	2006-06-19	61
34	95	2006-06-19	61
34	121	2006-06-19	61
39	65	2006-06-19	33
39	671	2006-06-19	33
39	145	2006-06-19	33
39	141	2006-06-19	3
39	305	2006-06-19	33
39	49	2006-06-19	33
39	71	2006-06-19	33
39	73	2006-06-19	33
39	484	2006-06-19	33
39	143	2006-06-19	33
39	74	2006-06-19	3
39	75	2006-06-19	33
39	60	2006-06-19	33
39	61	2006-06-19	33
39	34	2006-06-19	33
39	81	2006-06-19	33
39	672	2006-06-19	33
39	12	2006-06-19	33
39	240	2006-06-19	33
39	129	2006-06-19	33
39	675	2006-06-19	33
39	313	2006-06-19	33
39	114	2006-06-19	33
39	117	2006-06-19	33
39	85	2006-06-19	33
39	118	2006-06-19	33
39	119	2006-06-19	33
39	96	2006-06-19	33
39	120	2006-06-19	33
39	123	2006-06-19	33
39	126	2006-06-19	33
39	56	2006-06-19	33
39	323	2006-06-19	33
39	270	2006-06-22	18
39	269	2006-06-22	18
39	271	2006-06-22	18
39	193	2006-06-22	18
39	273	2006-06-22	18
39	260	2006-06-22	18
39	261	2006-06-22	18
39	203	2006-06-22	18
39	275	2006-06-22	18
39	276	2006-06-22	18
39	207	2006-06-22	18
39	262	2006-06-22	18
39	263	2006-06-22	18
39	264	2006-06-22	18
39	265	2006-06-22	18
39	266	2006-06-22	18
39	267	2006-06-22	18
39	279	2006-06-22	18
39	280	2006-06-22	18
39	281	2006-06-22	18
39	282	2006-06-22	18
39	284	2006-06-22	18
39	285	2006-06-22	18
39	286	2006-06-22	18
39	283	2006-06-22	18
39	208	2006-06-22	18
39	210	2006-06-22	18
39	288	2006-06-22	18
39	289	2006-06-22	18
39	290	2006-06-22	18
39	184	2006-06-22	18
39	291	2006-06-22	18
39	292	2006-06-22	18
39	293	2006-06-22	18
39	294	2006-06-22	18
39	295	2006-06-22	18
39	253	2006-06-22	18
39	685	2006-06-22	18
39	272	2006-06-22	18
39	687	2006-06-22	7
139	723	2006-11-01	26
148	743	2006-11-01	21
148	745	2006-11-01	21
142	744	2006-11-01	1
142	745	2006-11-01	1
140	2	2006-06-28	1
140	577	2006-06-28	1
140	49	2006-06-28	1
140	360	2006-06-28	1
140	254	2006-06-28	1
140	578	2006-06-28	1
140	714	2006-06-28	1
140	255	2006-06-28	1
140	183	2006-06-28	1
140	1	2006-06-28	1
140	58	2006-06-28	1
140	673	2006-06-28	1
140	257	2006-06-28	1
140	576	2006-06-28	1
140	620	2006-06-28	1
140	113	2006-06-28	1
140	116	2006-06-28	1
140	18	2006-06-28	1
140	20	2006-06-28	1
140	21	2006-06-28	1
140	56	2006-06-28	1
140	717	2006-06-28	1
141	2	2006-06-28	1
141	577	2006-06-28	1
141	49	2006-06-28	1
141	360	2006-06-28	1
141	254	2006-06-28	1
141	578	2006-06-28	1
141	714	2006-06-28	1
141	255	2006-06-28	1
141	183	2006-06-28	1
141	1	2006-06-28	1
141	58	2006-06-28	1
141	673	2006-06-28	1
141	257	2006-06-28	1
141	576	2006-06-28	1
141	620	2006-06-28	1
141	113	2006-06-28	1
141	116	2006-06-28	1
141	18	2006-06-28	1
141	20	2006-06-28	1
141	21	2006-06-28	1
141	56	2006-06-28	1
141	717	2006-06-28	1
142	2	2006-06-28	1
142	577	2006-06-28	1
142	49	2006-06-28	1
142	360	2006-06-28	1
142	254	2006-06-28	1
142	578	2006-06-28	1
142	714	2006-06-28	1
142	255	2006-06-28	1
142	183	2006-06-28	1
142	1	2006-06-28	1
142	58	2006-06-28	1
142	673	2006-06-28	1
142	257	2006-06-28	1
142	576	2006-06-28	1
142	620	2006-06-28	1
142	113	2006-06-28	1
142	116	2006-06-28	1
142	18	2006-06-28	1
142	20	2006-06-28	1
142	21	2006-06-28	1
142	56	2006-06-28	1
142	717	2006-06-28	1
143	2	2006-06-28	1
143	577	2006-06-28	1
143	49	2006-06-28	1
143	360	2006-06-28	1
143	254	2006-06-28	1
143	578	2006-06-28	1
143	714	2006-06-28	1
143	255	2006-06-28	1
143	183	2006-06-28	1
143	1	2006-06-28	1
143	58	2006-06-28	1
143	673	2006-06-28	1
143	257	2006-06-28	1
143	576	2006-06-28	1
143	620	2006-06-28	1
143	113	2006-06-28	1
143	116	2006-06-28	1
143	18	2006-06-28	1
143	20	2006-06-28	1
143	21	2006-06-28	1
143	56	2006-06-28	1
143	717	2006-06-28	1
144	2	2006-06-28	1
144	577	2006-06-28	1
144	49	2006-06-28	1
144	360	2006-06-28	1
144	254	2006-06-28	1
144	578	2006-06-28	1
144	714	2006-06-28	1
144	255	2006-06-28	1
144	183	2006-06-28	1
144	1	2006-06-28	1
144	58	2006-06-28	1
144	673	2006-06-28	1
144	257	2006-06-28	1
144	576	2006-06-28	1
144	620	2006-06-28	1
144	113	2006-06-28	1
144	116	2006-06-28	1
144	18	2006-06-28	1
144	20	2006-06-28	1
144	21	2006-06-28	1
144	56	2006-06-28	1
144	717	2006-06-28	1
145	2	2006-06-28	1
145	577	2006-06-28	1
145	49	2006-06-28	1
145	360	2006-06-28	1
145	254	2006-06-28	1
145	578	2006-06-28	1
145	714	2006-06-28	1
145	255	2006-06-28	1
145	183	2006-06-28	1
145	1	2006-06-28	1
145	58	2006-06-28	1
145	673	2006-06-28	1
145	257	2006-06-28	1
145	576	2006-06-28	1
145	620	2006-06-28	1
145	113	2006-06-28	1
145	116	2006-06-28	1
145	18	2006-06-28	1
145	20	2006-06-28	1
145	21	2006-06-28	1
145	56	2006-06-28	1
145	717	2006-06-28	1
146	2	2006-06-28	1
146	577	2006-06-28	1
146	49	2006-06-28	1
146	360	2006-06-28	1
146	254	2006-06-28	1
146	578	2006-06-28	1
146	714	2006-06-28	1
146	255	2006-06-28	1
146	183	2006-06-28	1
146	1	2006-06-28	1
146	58	2006-06-28	1
146	673	2006-06-28	1
146	257	2006-06-28	1
146	576	2006-06-28	1
146	620	2006-06-28	1
146	113	2006-06-28	1
146	116	2006-06-28	1
146	18	2006-06-28	1
146	20	2006-06-28	1
146	21	2006-06-28	1
146	56	2006-06-28	1
146	717	2006-06-28	1
139	746	2006-11-01	25
139	724	2006-11-01	25
139	725	2006-11-01	25
139	741	2006-11-01	25
139	726	2006-11-01	25
139	727	2006-11-01	25
139	728	2006-11-01	25
139	739	2006-11-01	25
139	729	2006-11-01	25
139	742	2006-11-01	25
139	738	2006-11-01	25
139	730	2006-11-01	25
139	747	2006-11-01	25
139	731	2006-11-01	25
139	740	2006-11-01	25
139	748	2006-11-01	25
139	734	2006-11-01	25
139	736	2006-11-01	25
139	737	2006-11-01	25
149	269	2006-11-01	21
149	193	2006-11-01	21
149	685	2006-11-01	21
149	273	2006-11-01	21
149	225	2006-11-01	21
149	203	2006-11-01	1
149	684	2006-11-01	21
11	753	2006-11-01	13
11	60	2006-11-01	13
11	61	2006-11-01	13
11	721	2006-11-01	13
11	117	2006-11-01	13
11	756	2006-11-01	13
11	754	2006-11-01	13
11	607	2006-11-01	13
11	755	2006-11-01	13
11	757	2006-11-01	13
11	758	2006-11-01	13
11	759	2006-11-01	13
11	299	2006-11-01	13
11	760	2006-11-01	13
11	761	2006-11-01	13
11	305	2006-11-01	13
11	762	2006-11-01	13
11	308	2006-11-01	13
12	758	2006-11-02	16
12	762	2006-11-02	16
12	753	2006-11-02	16
12	305	2006-11-02	16
12	759	2006-11-02	16
12	308	2006-11-02	16
12	60	2006-11-02	16
12	61	2006-11-02	16
12	721	2006-11-02	16
12	117	2006-11-02	16
12	299	2006-11-02	16
12	757	2006-11-02	16
12	756	2006-11-02	16
12	754	2006-11-02	16
12	607	2006-11-02	16
12	755	2006-11-02	16
12	763	2006-11-02	16
12	764	2006-11-02	16
12	765	2006-11-02	16
150	100	2006-11-02	1
150	144	2006-11-02	1
150	101	2006-11-02	1
150	102	2006-11-02	1
150	758	2006-11-02	1
150	762	2006-11-02	1
150	145	2006-11-02	1
150	141	2006-11-02	1
150	753	2006-11-02	1
150	146	2006-11-02	1
150	24	2006-11-02	1
150	305	2006-11-02	1
150	4	2006-11-02	1
150	128	2006-11-02	1
150	49	2006-11-02	1
150	759	2006-11-02	1
150	308	2006-11-02	1
150	26	2006-11-02	1
150	33	2006-11-02	1
150	27	2006-11-02	1
150	148	2006-11-02	1
150	441	2006-11-02	1
150	152	2006-11-02	1
150	150	2006-11-02	1
150	143	2006-11-02	1
150	122	2006-11-02	1
150	142	2006-11-02	1
150	153	2006-11-02	1
150	132	2006-11-02	1
150	60	2006-11-02	1
150	61	2006-11-02	1
150	12	2006-11-02	1
150	131	2006-11-02	1
150	721	2006-11-02	1
150	16	2006-11-02	1
150	28	2006-11-02	1
150	117	2006-11-02	1
150	136	2006-11-02	1
150	119	2006-11-02	1
150	138	2006-11-02	1
150	139	2006-11-02	1
150	21	2006-11-02	1
150	764	2006-11-02	1
150	299	2006-11-02	1
150	56	2006-11-02	1
150	766	2006-11-02	1
151	100	2006-11-02	1
151	144	2006-11-02	1
151	101	2006-11-02	1
151	102	2006-11-02	1
151	758	2006-11-02	1
151	762	2006-11-02	1
151	145	2006-11-02	1
151	141	2006-11-02	1
151	753	2006-11-02	1
151	146	2006-11-02	1
151	24	2006-11-02	1
151	305	2006-11-02	1
151	4	2006-11-02	1
151	766	2006-11-02	1
151	128	2006-11-02	1
151	49	2006-11-02	1
151	759	2006-11-02	1
151	308	2006-11-02	1
151	26	2006-11-02	1
151	33	2006-11-02	1
151	27	2006-11-02	1
151	148	2006-11-02	1
151	441	2006-11-02	1
151	152	2006-11-02	1
151	150	2006-11-02	1
151	143	2006-11-02	1
151	122	2006-11-02	1
151	142	2006-11-02	1
151	153	2006-11-02	1
151	132	2006-11-02	1
151	60	2006-11-02	1
151	61	2006-11-02	1
151	12	2006-11-02	1
151	131	2006-11-02	1
151	721	2006-11-02	1
151	16	2006-11-02	1
151	28	2006-11-02	1
151	117	2006-11-02	1
151	136	2006-11-02	1
151	119	2006-11-02	1
151	138	2006-11-02	1
151	139	2006-11-02	1
151	21	2006-11-02	1
151	764	2006-11-02	1
151	299	2006-11-02	1
151	56	2006-11-02	1
22	100	2006-05-23	1
22	144	2006-05-23	1
22	101	2006-05-23	1
22	102	2006-05-23	1
22	758	2006-11-02	1
22	762	2006-11-02	1
22	145	2006-05-23	1
22	141	2006-05-23	1
22	753	2006-11-02	1
22	146	2006-05-23	1
22	24	2006-05-23	1
22	305	2006-11-02	1
22	4	2006-11-02	1
22	766	2006-11-02	1
22	128	2006-05-23	1
22	49	2006-05-23	1
22	759	2006-11-02	1
22	308	2006-11-02	1
22	26	2006-05-23	1
22	33	2006-05-23	1
22	27	2006-05-23	1
22	148	2006-05-23	1
22	441	2006-11-02	1
22	152	2006-05-23	1
22	150	2006-05-23	1
22	143	2006-05-23	1
22	122	2006-05-23	1
22	142	2006-05-23	1
22	153	2006-05-23	1
22	132	2006-05-23	1
22	60	2006-11-02	1
22	61	2006-11-02	1
22	12	2006-05-23	1
22	131	2006-05-23	1
22	721	2006-11-02	1
22	16	2006-05-23	1
22	28	2006-05-23	1
22	117	2006-05-23	1
22	136	2006-05-23	1
22	119	2006-05-23	1
22	138	2006-05-23	1
22	139	2006-05-23	1
22	21	2006-05-23	1
22	764	2006-11-02	1
22	299	2006-11-02	1
22	56	2006-05-23	1
23	100	2006-05-23	1
23	144	2006-05-23	1
23	101	2006-05-23	1
23	102	2006-05-23	1
23	758	2006-11-02	1
23	762	2006-11-02	1
23	145	2006-05-23	1
23	141	2006-05-23	1
23	753	2006-11-02	1
23	146	2006-05-23	1
23	24	2006-05-23	1
23	305	2006-11-02	1
23	4	2006-11-02	1
23	766	2006-11-02	1
23	128	2006-05-23	1
23	49	2006-05-23	1
23	759	2006-11-02	1
23	308	2006-11-02	1
23	26	2006-05-23	1
23	33	2006-05-23	1
23	27	2006-05-23	1
23	148	2006-05-23	1
23	441	2006-11-02	1
23	152	2006-05-23	1
23	150	2006-05-23	1
23	143	2006-05-23	1
23	122	2006-05-23	1
23	142	2006-05-23	1
23	153	2006-05-23	1
23	132	2006-05-23	1
23	60	2006-11-02	1
23	61	2006-11-02	1
23	12	2006-05-23	1
23	131	2006-05-23	1
23	721	2006-11-02	1
23	16	2006-05-23	1
23	28	2006-05-23	1
23	117	2006-05-23	1
23	136	2006-05-23	1
23	119	2006-05-23	1
23	138	2006-05-23	1
23	139	2006-05-23	1
23	21	2006-05-23	1
23	764	2006-11-02	1
23	299	2006-11-02	1
23	56	2006-05-23	1
152	100	2006-11-02	1
152	144	2006-11-02	1
152	101	2006-11-02	1
152	102	2006-11-02	1
152	758	2006-11-02	1
152	762	2006-11-02	1
152	145	2006-11-02	1
152	141	2006-11-02	1
152	753	2006-11-02	1
152	146	2006-11-02	1
152	24	2006-11-02	1
152	305	2006-11-02	1
152	4	2006-11-02	1
152	766	2006-11-02	1
152	128	2006-11-02	1
152	49	2006-11-02	1
152	759	2006-11-02	1
152	308	2006-11-02	1
152	26	2006-11-02	1
152	33	2006-11-02	1
152	27	2006-11-02	1
152	148	2006-11-02	1
152	152	2006-11-02	1
152	150	2006-11-02	1
152	143	2006-11-02	1
152	122	2006-11-02	1
152	142	2006-11-02	1
152	153	2006-11-02	1
152	132	2006-11-02	1
152	60	2006-11-02	1
152	61	2006-11-02	1
152	12	2006-11-02	1
152	131	2006-11-02	1
152	721	2006-11-02	1
152	16	2006-11-02	1
152	117	2006-11-02	1
152	136	2006-11-02	1
152	119	2006-11-02	1
152	138	2006-11-02	1
152	139	2006-11-02	1
152	21	2006-11-02	1
152	764	2006-11-02	1
152	299	2006-11-02	1
152	56	2006-11-02	1
152	441	2006-11-02	1
152	28	2006-11-02	1
153	100	2006-11-02	1
153	144	2006-11-02	1
153	101	2006-11-02	1
153	102	2006-11-02	1
153	758	2006-11-02	1
153	762	2006-11-02	1
153	145	2006-11-02	1
153	753	2006-11-02	1
153	146	2006-11-02	1
153	24	2006-11-02	1
153	305	2006-11-02	1
153	4	2006-11-02	1
153	766	2006-11-02	1
153	128	2006-11-02	1
153	49	2006-11-02	1
153	759	2006-11-02	1
153	308	2006-11-02	1
153	26	2006-11-02	1
153	33	2006-11-02	1
153	27	2006-11-02	1
153	148	2006-11-02	1
153	441	2006-11-02	1
153	152	2006-11-02	1
153	150	2006-11-02	1
153	143	2006-11-02	1
153	122	2006-11-02	1
153	142	2006-11-02	1
153	153	2006-11-02	1
153	132	2006-11-02	1
153	60	2006-11-02	1
153	61	2006-11-02	1
153	12	2006-11-02	1
153	131	2006-11-02	1
153	721	2006-11-02	1
153	16	2006-11-02	1
153	28	2006-11-02	1
153	117	2006-11-02	1
153	136	2006-11-02	1
153	119	2006-11-02	1
153	138	2006-11-02	1
153	139	2006-11-02	1
153	21	2006-11-02	1
153	764	2006-11-02	1
153	299	2006-11-02	1
153	56	2006-11-02	1
24	758	2006-11-02	1
24	762	2006-11-02	1
24	753	2006-11-02	1
24	305	2006-11-02	1
24	4	2006-11-02	1
24	766	2006-11-02	1
24	759	2006-11-02	1
24	308	2006-11-02	1
24	441	2006-11-02	1
24	60	2006-11-02	1
24	61	2006-11-02	1
24	721	2006-11-02	1
24	764	2006-11-02	1
24	299	2006-11-02	1
39	724	2006-11-02	25
39	725	2006-11-02	25
39	741	2006-11-02	25
39	726	2006-11-02	25
39	727	2006-11-02	25
39	728	2006-11-02	25
39	729	2006-11-02	25
39	742	2006-11-02	25
39	730	2006-11-02	25
39	747	2006-11-02	25
39	731	2006-11-02	25
39	740	2006-11-02	25
39	748	2006-11-02	25
39	734	2006-11-02	25
39	736	2006-11-02	25
39	737	2006-11-02	25
39	767	2006-11-02	25
39	768	2006-11-02	25
25	758	2006-11-02	1
25	762	2006-11-02	1
25	753	2006-11-02	1
25	305	2006-11-02	1
25	4	2006-11-02	1
25	766	2006-11-02	1
25	759	2006-11-02	1
25	308	2006-11-02	1
25	441	2006-11-02	1
25	60	2006-11-02	1
25	61	2006-11-02	1
25	721	2006-11-02	1
25	764	2006-11-02	1
25	299	2006-11-02	1
154	100	2006-11-02	1
154	144	2006-11-02	1
154	101	2006-11-02	1
154	102	2006-11-02	1
154	758	2006-11-02	1
154	762	2006-11-02	1
154	145	2006-11-02	1
154	141	2006-11-02	1
154	753	2006-11-02	1
154	146	2006-11-02	1
154	24	2006-11-02	1
154	305	2006-11-02	1
154	4	2006-11-02	1
154	766	2006-11-02	1
154	128	2006-11-02	1
154	49	2006-11-02	1
154	759	2006-11-02	1
154	308	2006-11-02	1
154	26	2006-11-02	1
154	33	2006-11-02	1
154	27	2006-11-02	1
154	148	2006-11-02	1
154	441	2006-11-02	1
154	152	2006-11-02	1
154	150	2006-11-02	1
154	143	2006-11-02	1
154	122	2006-11-02	1
154	142	2006-11-02	1
154	153	2006-11-02	1
154	132	2006-11-02	1
154	60	2006-11-02	1
154	61	2006-11-02	1
154	12	2006-11-02	1
154	131	2006-11-02	1
154	721	2006-11-02	1
154	16	2006-11-02	1
154	28	2006-11-02	1
154	117	2006-11-02	1
154	136	2006-11-02	1
154	119	2006-11-02	1
154	138	2006-11-02	1
154	139	2006-11-02	1
154	21	2006-11-02	1
154	764	2006-11-02	1
154	299	2006-11-02	1
154	56	2006-11-02	1
26	100	2006-05-23	1
26	144	2006-05-23	1
26	101	2006-05-23	1
26	102	2006-05-23	1
26	758	2006-11-02	1
26	762	2006-11-02	1
26	145	2006-05-23	1
26	141	2006-05-23	1
26	753	2006-11-02	1
26	146	2006-05-23	1
26	24	2006-05-23	1
26	305	2006-11-02	1
26	4	2006-11-02	1
26	766	2006-11-02	1
26	128	2006-05-23	1
26	49	2006-05-23	1
26	759	2006-11-02	1
26	308	2006-11-02	1
26	26	2006-05-23	1
26	33	2006-05-23	1
26	27	2006-05-23	1
26	148	2006-05-23	1
26	441	2006-11-02	1
26	152	2006-05-23	1
26	150	2006-05-23	1
26	143	2006-05-23	1
26	122	2006-05-23	1
26	142	2006-05-23	1
26	153	2006-05-23	1
26	132	2006-05-23	1
26	60	2006-11-02	1
26	61	2006-11-02	1
26	12	2006-05-23	1
26	131	2006-05-23	1
26	721	2006-11-02	1
26	16	2006-05-23	1
26	28	2006-05-23	1
26	117	2006-05-23	1
26	136	2006-05-23	1
26	119	2006-05-23	1
26	138	2006-05-23	1
26	139	2006-05-23	1
26	21	2006-05-23	1
26	764	2006-11-02	1
26	299	2006-11-02	1
26	56	2006-05-23	1
155	144	2006-11-02	25
155	758	2006-11-02	25
155	762	2006-11-02	25
155	145	2006-11-02	25
155	141	2006-11-02	25
155	753	2006-11-02	25
155	146	2006-11-02	25
155	305	2006-11-02	25
155	4	2006-11-02	25
155	766	2006-11-02	25
155	128	2006-11-02	25
155	49	2006-11-02	25
155	759	2006-11-02	25
155	308	2006-11-02	25
155	148	2006-11-02	25
155	649	2006-11-02	25
155	648	2006-11-02	25
155	650	2006-11-02	25
155	653	2006-11-02	25
155	651	2006-11-02	25
155	652	2006-11-02	25
155	441	2006-11-02	25
155	152	2006-11-02	25
155	150	2006-11-02	25
155	143	2006-11-02	25
155	122	2006-11-02	25
155	142	2006-11-02	25
155	153	2006-11-02	25
155	132	2006-11-02	25
155	60	2006-11-02	1
155	61	2006-11-02	25
155	12	2006-11-02	25
155	129	2006-11-02	25
155	135	2006-11-02	1
155	131	2006-11-02	25
155	721	2006-11-02	25
155	117	2006-11-02	25
155	136	2006-11-02	25
155	119	2006-11-02	25
155	138	2006-11-02	25
155	139	2006-11-02	25
155	21	2006-11-02	25
155	299	2006-11-02	25
155	56	2006-11-02	25
156	144	2006-11-02	28
156	758	2006-11-02	28
156	762	2006-11-02	28
156	145	2006-11-02	28
156	141	2006-11-02	28
156	753	2006-11-02	28
156	146	2006-11-02	28
156	305	2006-11-02	28
156	4	2006-11-02	28
156	766	2006-11-02	28
156	128	2006-11-02	28
156	49	2006-11-02	28
156	759	2006-11-02	28
156	308	2006-11-02	28
156	148	2006-11-02	28
156	649	2006-11-02	28
156	648	2006-11-02	28
156	650	2006-11-02	28
156	653	2006-11-02	28
156	651	2006-11-02	28
156	652	2006-11-02	28
156	441	2006-11-02	28
156	152	2006-11-02	28
156	150	2006-11-02	28
156	143	2006-11-02	28
156	122	2006-11-02	28
156	142	2006-11-02	28
156	153	2006-11-02	28
156	132	2006-11-02	28
156	60	2006-11-02	1
156	61	2006-11-02	28
156	12	2006-11-02	28
156	129	2006-11-02	28
156	131	2006-11-02	28
156	721	2006-11-02	28
156	117	2006-11-02	28
156	136	2006-11-02	28
156	119	2006-11-02	28
156	138	2006-11-02	28
156	139	2006-11-02	28
156	21	2006-11-02	28
156	299	2006-11-02	28
156	56	2006-11-02	28
155	769	2006-11-02	25
156	769	2006-11-02	28
28	100	2006-05-23	1
28	144	2006-05-23	1
28	101	2006-05-23	1
28	102	2006-05-23	1
28	758	2006-11-02	1
28	762	2006-11-02	1
28	145	2006-05-23	1
28	141	2006-05-23	1
28	753	2006-11-02	1
28	146	2006-05-23	1
28	24	2006-05-23	1
28	305	2006-11-02	1
28	4	2006-11-02	1
28	766	2006-11-02	1
28	128	2006-05-23	1
28	49	2006-05-23	1
28	759	2006-11-02	1
28	308	2006-11-02	1
28	26	2006-05-23	1
28	33	2006-05-23	1
28	27	2006-05-23	1
28	148	2006-05-23	1
28	441	2006-11-02	1
28	152	2006-05-23	1
28	150	2006-05-23	1
28	143	2006-05-23	1
28	122	2006-05-23	1
28	142	2006-05-23	1
28	153	2006-05-23	1
28	132	2006-05-23	1
28	60	2006-11-02	1
28	61	2006-11-02	1
28	12	2006-05-23	1
28	131	2006-05-23	1
28	721	2006-11-02	1
28	16	2006-05-23	1
28	28	2006-05-23	1
28	117	2006-05-23	1
28	136	2006-05-23	1
28	119	2006-05-23	1
28	138	2006-05-23	1
28	139	2006-05-23	1
28	21	2006-05-23	1
28	764	2006-11-02	1
28	299	2006-11-02	1
28	56	2006-05-23	1
29	100	2006-05-23	1
29	144	2006-05-23	1
29	101	2006-05-23	1
29	102	2006-05-23	1
29	758	2006-11-02	1
29	762	2006-11-02	1
29	145	2006-05-23	1
29	141	2006-05-23	1
29	753	2006-11-02	1
29	146	2006-05-23	1
29	24	2006-05-23	1
29	305	2006-11-02	1
29	4	2006-11-02	1
29	766	2006-11-02	1
29	128	2006-05-23	1
29	49	2006-05-23	1
29	759	2006-11-02	1
29	308	2006-11-02	1
29	26	2006-05-23	1
29	33	2006-05-23	1
29	27	2006-05-23	1
29	148	2006-05-23	1
29	441	2006-11-02	1
29	152	2006-05-23	1
29	150	2006-05-23	1
29	143	2006-05-23	1
29	122	2006-05-23	1
29	142	2006-05-23	1
29	153	2006-05-23	1
29	132	2006-05-23	1
29	60	2006-11-02	1
29	61	2006-11-02	1
29	12	2006-05-23	1
29	131	2006-05-23	1
29	721	2006-11-02	1
29	16	2006-05-23	1
29	28	2006-05-23	1
29	117	2006-05-23	1
29	136	2006-05-23	1
29	119	2006-05-23	1
29	138	2006-05-23	1
29	139	2006-05-23	1
29	21	2006-05-23	1
29	764	2006-11-02	1
29	299	2006-11-02	1
29	56	2006-05-23	1
30	100	2006-05-23	1
30	144	2006-05-23	1
30	101	2006-05-23	1
30	102	2006-05-23	1
30	758	2006-11-02	1
30	762	2006-11-02	1
30	145	2006-05-23	1
30	141	2006-05-23	1
30	753	2006-11-02	1
30	146	2006-05-23	1
30	24	2006-05-23	1
30	305	2006-11-02	1
30	4	2006-11-02	1
30	766	2006-11-02	1
30	128	2006-05-23	1
30	49	2006-05-23	1
30	759	2006-11-02	1
30	308	2006-11-02	1
30	26	2006-05-23	1
30	33	2006-05-23	1
30	27	2006-05-23	1
30	148	2006-05-23	1
30	441	2006-11-02	1
30	152	2006-05-23	1
30	150	2006-05-23	1
30	143	2006-05-23	1
30	122	2006-05-23	1
30	142	2006-05-23	1
30	153	2006-05-23	1
30	132	2006-05-23	1
30	60	2006-11-02	1
30	61	2006-11-02	1
30	12	2006-05-23	1
30	131	2006-05-23	1
30	721	2006-11-02	1
30	16	2006-05-23	1
30	28	2006-05-23	1
30	117	2006-05-23	1
30	136	2006-05-23	1
30	119	2006-05-23	1
30	138	2006-05-23	1
30	139	2006-05-23	1
30	21	2006-05-23	1
30	764	2006-11-02	1
30	299	2006-11-02	1
30	56	2006-05-23	1
32	100	2006-05-23	1
32	144	2006-05-23	1
32	101	2006-05-23	1
32	102	2006-05-23	1
32	758	2006-11-02	1
32	762	2006-11-02	1
32	145	2006-05-23	1
32	141	2006-05-23	1
32	753	2006-11-02	1
32	146	2006-05-23	1
32	24	2006-05-23	1
32	305	2006-11-02	1
32	4	2006-11-02	1
32	766	2006-11-02	1
32	128	2006-05-23	1
32	49	2006-05-23	1
32	759	2006-11-02	1
32	308	2006-11-02	1
32	26	2006-05-23	1
32	33	2006-05-23	1
32	27	2006-05-23	1
32	148	2006-05-23	1
32	441	2006-11-02	1
32	152	2006-05-23	1
32	150	2006-05-23	1
32	143	2006-05-23	1
32	122	2006-05-23	1
32	142	2006-05-23	1
32	153	2006-05-23	1
32	132	2006-05-23	1
32	60	2006-11-02	1
32	61	2006-11-02	1
32	12	2006-05-23	1
32	131	2006-05-23	1
32	721	2006-11-02	1
32	16	2006-05-23	1
32	28	2006-05-23	1
32	117	2006-05-23	1
32	119	2006-05-23	1
32	138	2006-05-23	1
32	139	2006-05-23	1
32	21	2006-05-23	1
32	764	2006-11-02	1
32	299	2006-11-02	1
32	56	2006-05-23	1
157	144	2006-11-03	24
157	758	2006-11-03	24
157	762	2006-11-03	24
157	145	2006-11-03	24
157	141	2006-11-03	24
157	753	2006-11-03	24
157	146	2006-11-03	24
157	305	2006-11-03	24
157	4	2006-11-03	24
157	766	2006-11-03	24
157	128	2006-11-03	24
157	49	2006-11-03	24
157	759	2006-11-03	24
157	308	2006-11-03	24
157	647	2006-11-03	24
157	148	2006-11-03	24
157	648	2006-11-03	24
157	649	2006-11-03	24
157	650	2006-11-03	24
157	653	2006-11-03	24
157	651	2006-11-03	24
157	652	2006-11-03	24
157	441	2006-11-03	24
157	152	2006-11-03	24
157	150	2006-11-03	24
157	143	2006-11-03	24
157	122	2006-11-03	24
157	142	2006-11-03	24
157	153	2006-11-03	24
157	132	2006-11-03	24
157	60	2006-11-03	1
157	61	2006-11-03	24
157	12	2006-11-03	24
157	769	2006-11-03	24
157	129	2006-11-03	24
157	131	2006-11-03	24
157	721	2006-11-03	24
157	117	2006-11-03	24
157	136	2006-11-03	24
157	119	2006-11-03	24
157	138	2006-11-03	24
157	139	2006-11-03	24
157	21	2006-11-03	24
157	299	2006-11-03	24
157	56	2006-11-03	24
156	140	2006-11-03	1
157	140	2006-11-03	1
158	144	2006-11-03	28
158	758	2006-11-03	28
158	762	2006-11-03	28
158	145	2006-11-03	28
158	141	2006-11-03	28
158	753	2006-11-03	28
158	146	2006-11-03	28
158	305	2006-11-03	28
158	4	2006-11-03	28
158	766	2006-11-03	28
158	128	2006-11-03	28
158	49	2006-11-03	28
158	759	2006-11-03	28
158	308	2006-11-03	28
158	148	2006-11-03	28
158	648	2006-11-03	28
158	649	2006-11-03	28
158	650	2006-11-03	28
158	653	2006-11-03	28
158	651	2006-11-03	28
158	652	2006-11-03	28
158	441	2006-11-03	28
158	152	2006-11-03	28
158	150	2006-11-03	28
158	143	2006-11-03	28
158	122	2006-11-03	28
158	142	2006-11-03	28
158	153	2006-11-03	28
158	132	2006-11-03	28
158	60	2006-11-03	1
158	61	2006-11-03	28
158	12	2006-11-03	28
158	769	2006-11-03	28
158	129	2006-11-03	28
158	135	2006-11-03	28
158	131	2006-11-03	28
158	721	2006-11-03	28
158	117	2006-11-03	28
158	136	2006-11-03	28
158	119	2006-11-03	28
158	138	2006-11-03	28
158	139	2006-11-03	28
158	299	2006-11-03	28
158	56	2006-11-03	28
159	144	2006-11-03	27
159	758	2006-11-03	27
159	762	2006-11-03	27
159	145	2006-11-03	27
159	141	2006-11-03	27
159	753	2006-11-03	27
159	146	2006-11-03	27
159	305	2006-11-03	27
159	4	2006-11-03	27
159	766	2006-11-03	27
159	128	2006-11-03	27
159	49	2006-11-03	27
159	759	2006-11-03	27
159	308	2006-11-03	27
159	148	2006-11-03	27
159	648	2006-11-03	27
159	649	2006-11-03	27
159	650	2006-11-03	27
159	653	2006-11-03	27
159	651	2006-11-03	27
159	652	2006-11-03	27
159	441	2006-11-03	27
159	152	2006-11-03	27
159	150	2006-11-03	27
159	143	2006-11-03	27
159	122	2006-11-03	27
159	142	2006-11-03	27
159	153	2006-11-03	27
159	132	2006-11-03	27
159	60	2006-11-03	1
159	61	2006-11-03	27
159	12	2006-11-03	27
159	769	2006-11-03	27
159	129	2006-11-03	27
159	131	2006-11-03	27
159	721	2006-11-03	27
159	117	2006-11-03	27
159	136	2006-11-03	27
159	119	2006-11-03	27
159	138	2006-11-03	27
159	139	2006-11-03	27
159	140	2006-11-03	27
159	21	2006-11-03	27
159	299	2006-11-03	27
159	56	2006-11-03	27
9	758	2006-11-03	29
9	753	2006-11-03	29
9	766	2006-11-03	29
9	308	2006-11-03	29
9	647	2006-11-03	29
9	441	2006-11-03	29
9	60	2006-11-03	29
9	61	2006-11-03	29
9	769	2006-11-03	29
9	721	2006-11-03	29
9	119	2006-11-03	29
9	764	2006-11-03	29
9	299	2006-11-03	29
9	762	2006-11-03	29
9	305	2006-11-03	29
9	759	2006-11-03	29
9	140	2006-11-03	6
33	757	2006-11-03	26
33	756	2006-11-03	26
33	754	2006-11-03	26
33	607	2006-05-23	26
33	755	2006-11-03	26
33	721	2006-11-03	26
33	758	2006-11-03	26
33	762	2006-11-03	26
33	145	2006-05-23	26
33	141	2006-05-23	26
33	753	2006-11-03	26
33	305	2006-11-03	26
33	128	2006-05-23	26
33	49	2006-05-23	26
33	759	2006-11-03	26
33	308	2006-11-03	26
33	143	2006-05-23	26
33	122	2006-11-03	26
33	121	2006-05-23	26
33	142	2006-05-23	26
33	60	2006-11-03	26
33	61	2006-11-03	26
33	12	2006-05-23	26
33	129	2006-05-23	26
33	131	2006-05-23	26
33	117	2006-05-23	26
33	119	2006-05-23	26
33	299	2006-11-03	26
33	56	2006-05-23	26
33	770	2006-11-03	26
33	764	2006-11-03	26
33	771	2006-11-03	26
33	772	2006-11-03	26
33	765	2006-11-03	26
33	773	2006-11-03	26
13	144	2006-05-22	27
13	758	2006-11-03	27
13	762	2006-11-03	27
13	145	2006-05-22	27
13	141	2006-05-22	27
13	753	2006-11-03	27
13	146	2006-05-22	27
13	305	2006-11-03	27
13	4	2006-11-03	27
13	766	2006-11-03	27
13	128	2006-05-22	27
13	49	2006-05-22	27
13	759	2006-11-03	27
13	308	2006-11-03	27
13	441	2006-11-03	27
13	152	2006-05-22	27
13	150	2006-05-22	27
13	143	2006-05-22	27
13	122	2006-05-22	27
13	142	2006-05-22	27
13	153	2006-05-22	27
13	132	2006-11-03	27
13	60	2006-11-03	1
13	61	2006-11-03	27
13	12	2006-05-22	27
13	129	2006-05-22	27
13	131	2006-05-22	27
13	721	2006-11-03	27
13	117	2006-11-03	27
13	119	2006-05-22	27
13	138	2006-05-22	27
13	139	2006-05-22	27
13	21	2006-05-22	27
13	299	2006-11-03	27
13	56	2006-05-22	27
21	100	2006-05-23	23
21	144	2006-05-23	23
21	101	2006-05-23	23
21	102	2006-05-23	23
21	758	2006-11-03	23
21	762	2006-11-03	23
21	145	2006-05-23	23
21	141	2006-05-23	23
21	753	2006-11-03	23
21	24	2006-05-23	23
21	305	2006-11-03	23
21	128	2006-05-23	23
21	49	2006-05-23	23
21	759	2006-11-03	23
21	308	2006-11-03	23
21	26	2006-05-23	23
21	33	2006-05-23	23
21	27	2006-05-23	23
21	143	2006-05-23	23
21	122	2006-05-23	23
21	121	2006-11-03	23
21	142	2006-05-23	23
21	60	2006-11-03	23
21	61	2006-11-03	23
21	12	2006-05-23	23
21	129	2006-05-23	23
21	131	2006-05-23	23
21	721	2006-11-03	23
21	28	2006-05-23	23
21	117	2006-05-23	23
21	119	2006-05-23	23
21	21	2006-05-23	23
21	764	2006-11-03	23
21	299	2006-11-03	23
21	56	2006-05-23	23
21	757	2006-11-03	23
21	756	2006-11-03	23
21	754	2006-11-03	23
21	607	2006-11-03	23
21	755	2006-11-03	23
21	655	2006-11-03	23
21	771	2006-11-03	23
21	772	2006-11-03	23
21	304	2006-05-23	23
21	106	2006-05-23	23
21	605	2006-05-23	23
21	6	2006-05-23	23
21	770	2006-11-03	23
21	765	2006-11-03	23
21	610	2006-05-23	23
21	773	2006-11-03	23
13	769	2006-11-03	27
13	134	2006-11-03	1
14	144	2006-05-22	31
14	758	2006-11-03	31
14	762	2006-11-03	31
14	145	2006-05-22	31
14	141	2006-05-22	31
14	753	2006-11-03	31
14	146	2006-05-22	31
14	305	2006-11-03	31
14	4	2006-11-03	31
14	766	2006-11-03	31
14	128	2006-05-22	31
14	49	2006-05-22	31
14	759	2006-11-03	31
14	308	2006-11-03	31
14	148	2006-05-22	31
14	648	2006-05-22	31
14	649	2006-05-22	31
14	650	2006-05-22	31
14	653	2006-05-22	31
14	651	2006-05-22	31
14	652	2006-05-22	31
14	441	2006-11-03	31
14	152	2006-05-22	31
14	150	2006-05-22	31
14	143	2006-05-22	31
14	122	2006-05-22	31
14	142	2006-05-22	31
14	153	2006-05-22	31
14	132	2006-05-22	31
14	60	2006-11-03	1
14	61	2006-11-03	31
14	12	2006-05-22	31
14	769	2006-11-03	31
14	134	2006-11-03	1
14	129	2006-05-22	31
14	131	2006-05-22	31
14	721	2006-11-03	31
14	117	2006-05-22	31
14	136	2006-05-22	31
14	119	2006-05-22	31
14	138	2006-05-22	31
14	139	2006-05-22	31
14	21	2006-05-22	31
14	299	2006-11-03	31
14	56	2006-05-22	31
15	144	2006-05-22	19
15	758	2006-11-03	19
15	762	2006-11-03	19
15	145	2006-05-22	19
15	141	2006-05-22	19
15	753	2006-11-03	19
15	146	2006-05-22	19
15	305	2006-11-03	19
15	4	2006-11-03	19
15	766	2006-11-03	19
15	128	2006-05-22	19
15	49	2006-05-22	19
15	759	2006-11-03	19
15	308	2006-11-03	19
15	148	2006-05-22	19
15	648	2006-05-22	19
15	649	2006-05-22	19
15	650	2006-05-22	19
15	653	2006-05-22	19
15	651	2006-05-22	19
15	652	2006-05-22	19
15	441	2006-11-03	19
15	152	2006-05-22	19
15	150	2006-05-22	19
15	143	2006-05-22	19
15	122	2006-05-22	19
15	142	2006-05-22	19
15	153	2006-05-22	19
15	132	2006-05-22	19
15	60	2006-11-03	19
15	61	2006-11-03	19
15	12	2006-05-22	19
15	769	2006-11-03	19
15	134	2006-05-22	19
15	129	2006-05-22	19
15	131	2006-05-22	19
15	721	2006-11-03	19
15	117	2006-05-22	19
15	136	2006-05-22	19
15	119	2006-05-22	19
15	138	2006-05-22	19
15	139	2006-05-22	19
15	21	2006-05-22	19
15	299	2006-11-03	19
15	56	2006-05-22	19
16	144	2006-05-22	57
16	758	2006-11-03	57
16	762	2006-11-03	57
16	145	2006-05-22	57
16	141	2006-05-22	57
16	753	2006-11-03	57
16	146	2006-05-22	57
16	305	2006-11-03	57
16	4	2006-11-03	57
16	766	2006-11-03	57
16	128	2006-05-22	57
16	759	2006-11-03	57
16	308	2006-11-03	57
16	148	2006-05-22	57
16	648	2006-05-22	57
16	649	2006-05-22	57
16	650	2006-05-22	57
16	653	2006-05-22	57
16	651	2006-05-22	57
16	652	2006-05-22	57
16	441	2006-11-03	57
16	152	2006-05-22	57
16	150	2006-05-22	57
16	143	2006-05-22	57
16	122	2006-05-22	57
16	142	2006-05-22	57
16	153	2006-05-22	57
16	132	2006-05-22	57
16	60	2006-11-03	2
16	61	2006-11-03	57
16	12	2006-05-22	57
16	769	2006-11-03	57
16	129	2006-05-22	57
16	135	2006-05-22	57
16	131	2006-05-22	57
16	721	2006-11-03	57
16	117	2006-05-22	57
16	136	2006-05-22	57
16	119	2006-05-22	57
16	138	2006-05-22	57
16	139	2006-05-22	57
16	21	2006-05-22	57
16	299	2006-11-03	57
17	144	2006-05-22	25
17	758	2006-11-03	25
17	762	2006-11-03	25
17	145	2006-05-22	25
17	141	2006-05-22	25
17	753	2006-11-03	25
17	146	2006-05-22	25
17	305	2006-11-03	25
17	4	2006-11-03	25
17	766	2006-11-03	25
17	128	2006-05-22	25
17	49	2006-05-22	25
17	759	2006-11-03	25
17	308	2006-11-03	25
17	148	2006-05-22	25
17	648	2006-05-22	25
17	649	2006-05-22	25
17	650	2006-05-22	25
17	653	2006-05-22	25
17	651	2006-05-22	25
17	652	2006-05-22	25
17	441	2006-11-03	25
17	152	2006-05-22	25
17	150	2006-05-22	25
17	143	2006-05-22	25
17	122	2006-05-22	25
17	142	2006-05-22	25
17	153	2006-05-22	25
17	132	2006-05-22	25
17	60	2006-11-03	1
17	61	2006-11-03	25
17	12	2006-05-22	25
17	769	2006-11-03	25
17	134	2006-05-22	25
17	129	2006-05-22	25
17	135	2006-05-22	25
17	131	2006-05-22	25
17	721	2006-11-03	25
17	117	2006-05-22	25
17	136	2006-05-22	25
17	119	2006-05-22	25
17	138	2006-05-22	25
17	139	2006-05-22	25
17	21	2006-05-22	25
17	299	2006-11-03	25
17	56	2006-05-22	25
155	774	2006-11-03	1
156	774	2006-11-03	1
157	774	2006-11-03	1
9	774	2006-11-03	1
158	774	2006-11-03	1
159	774	2006-11-03	1
13	774	2006-11-03	1
14	774	2006-11-03	1
15	774	2006-11-03	1
16	774	2006-11-03	2
17	774	2006-11-03	1
20	144	2006-05-23	25
20	758	2006-11-03	25
20	762	2006-11-03	25
20	145	2006-05-23	25
20	141	2006-05-23	25
20	753	2006-11-03	25
20	305	2006-11-03	25
20	128	2006-05-23	25
20	49	2006-05-23	25
20	759	2006-11-03	25
20	308	2006-11-03	25
20	143	2006-05-23	25
20	142	2006-05-23	25
20	60	2006-11-03	25
20	61	2006-11-03	25
20	12	2006-05-23	25
20	129	2006-05-23	25
20	131	2006-05-23	25
20	115	2006-11-03	25
20	299	2006-11-03	25
20	771	2006-11-03	25
20	772	2006-11-03	25
20	773	2006-11-03	25
20	757	2006-11-03	25
20	756	2006-11-03	25
20	754	2006-11-03	25
20	607	2006-05-23	25
20	755	2006-11-03	25
20	770	2006-11-03	25
20	765	2006-11-03	25
20	764	2006-11-03	25
13	647	2006-11-03	1
14	647	2006-11-03	1
15	647	2006-11-03	1
16	647	2006-11-03	2
17	647	2006-11-03	1
18	144	2006-05-22	2
18	758	2006-11-03	2
18	762	2006-11-03	2
18	145	2006-05-22	2
18	141	2006-05-22	2
18	753	2006-11-03	2
18	146	2006-05-22	2
18	305	2006-11-03	2
18	4	2006-11-03	2
18	766	2006-11-03	2
18	128	2006-05-22	2
18	49	2006-05-22	2
18	759	2006-11-03	2
18	308	2006-11-03	2
18	647	2006-11-03	2
18	148	2006-05-22	2
18	648	2006-05-22	2
18	649	2006-05-22	2
18	650	2006-05-22	2
18	653	2006-05-22	2
18	651	2006-05-22	2
18	652	2006-05-22	2
18	441	2006-11-03	2
18	152	2006-05-22	2
18	150	2006-05-22	2
18	143	2006-05-22	2
18	122	2006-05-22	2
18	142	2006-05-22	2
18	153	2006-05-22	2
18	132	2006-05-22	2
18	774	2006-11-03	2
18	60	2006-11-03	2
18	61	2006-11-03	2
18	12	2006-05-22	2
18	769	2006-11-03	2
18	135	2006-05-22	2
18	131	2006-05-22	2
18	721	2006-11-03	2
18	117	2006-05-22	2
18	136	2006-05-22	2
18	119	2006-05-22	2
18	138	2006-05-22	2
18	139	2006-05-22	2
18	140	2006-11-03	2
18	21	2006-05-22	2
18	299	2006-11-03	2
18	56	2006-05-22	2
19	144	2006-05-22	2
19	758	2006-11-03	2
19	762	2006-11-03	2
19	145	2006-05-22	2
19	141	2006-05-22	2
19	753	2006-11-03	2
19	146	2006-05-22	2
19	305	2006-11-03	2
19	4	2006-11-03	2
19	766	2006-11-03	2
19	128	2006-05-22	2
19	49	2006-05-22	2
19	759	2006-11-03	2
19	308	2006-11-03	2
19	148	2006-05-22	2
19	648	2006-05-22	2
19	649	2006-05-22	2
19	650	2006-05-22	2
19	653	2006-05-22	2
19	651	2006-05-22	2
19	652	2006-05-22	2
19	441	2006-11-03	2
19	152	2006-05-22	2
19	150	2006-05-22	2
19	143	2006-05-22	2
19	122	2006-05-22	2
19	142	2006-05-22	2
19	153	2006-05-22	2
19	132	2006-05-22	2
19	774	2006-11-03	2
19	60	2006-11-03	2
19	61	2006-11-03	2
19	12	2006-05-22	2
19	769	2006-11-03	2
19	134	2006-05-22	2
19	135	2006-05-22	2
19	131	2006-05-22	2
19	721	2006-11-03	2
19	117	2006-05-22	2
19	136	2006-05-22	2
19	119	2006-05-22	2
19	138	2006-05-22	2
19	139	2006-05-22	2
19	140	2006-11-03	2
19	21	2006-05-22	2
19	299	2006-11-03	2
19	56	2006-05-22	2
158	140	2006-11-03	28
28	140	2006-11-03	1
29	140	2006-11-03	1
13	140	2006-11-03	1
14	140	2006-11-03	1
\.


SET SESSION AUTHORIZATION 'postgres';

--
-- Data for TOC entry 31 (OID 19355)
-- Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY department (id, name) FROM stdin;
6	General
7	Math
25	Library
21	Continuing Edu.
46	Social Science
48	Health Sciences
4	English World Languages
23	Student Services
41	Science and Tech.
8	Arts and Humanities
47	Business and Computer Systems
\.


SET SESSION AUTHORIZATION 'hubert';

--
-- TOC entry 16 (OID 17489)
-- Name: bindex; Type: INDEX; Schema: public; Owner: hubert
--

CREATE UNIQUE INDEX bindex ON building USING btree (name);


--
-- TOC entry 22 (OID 17491)
-- Name: rindex; Type: INDEX; Schema: public; Owner: hubert
--

CREATE UNIQUE INDEX rindex ON room USING btree (room_num, bid);


--
-- TOC entry 18 (OID 17801)
-- Name: sindex; Type: INDEX; Schema: public; Owner: hubert
--

CREATE UNIQUE INDEX sindex ON software USING btree (title, "version", platform);


--
-- TOC entry 17 (OID 17492)
-- Name: building_pkey; Type: CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY building
    ADD CONSTRAINT building_pkey PRIMARY KEY (id);


--
-- TOC entry 19 (OID 17494)
-- Name: software_pkey; Type: CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY software
    ADD CONSTRAINT software_pkey PRIMARY KEY (id);


SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 20 (OID 17496)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 21 (OID 17498)
-- Name: users_uname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_uname_key UNIQUE (uname);


SET SESSION AUTHORIZATION 'hubert';

--
-- TOC entry 23 (OID 17500)
-- Name: room_pkey; Type: CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);


--
-- TOC entry 24 (OID 17502)
-- Name: softroom_pkey; Type: CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY softroom
    ADD CONSTRAINT softroom_pkey PRIMARY KEY (sid, rid);


SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 25 (OID 19361)
-- Name: dept_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY department
    ADD CONSTRAINT dept_name_key UNIQUE (name);


SET SESSION AUTHORIZATION 'hubert';

--
-- TOC entry 32 (OID 17504)
-- Name: room_ref_build; Type: FK CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY room
    ADD CONSTRAINT room_ref_build FOREIGN KEY (bid) REFERENCES building(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 33 (OID 17508)
-- Name: softroom_ref_room; Type: FK CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY softroom
    ADD CONSTRAINT softroom_ref_room FOREIGN KEY (rid) REFERENCES room(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 34 (OID 17512)
-- Name: softroom_ref_software; Type: FK CONSTRAINT; Schema: public; Owner: hubert
--

ALTER TABLE ONLY softroom
    ADD CONSTRAINT softroom_ref_software FOREIGN KEY (sid) REFERENCES software(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 11 (OID 17422)
-- Name: building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hubert
--

SELECT pg_catalog.setval('building_id_seq', 13, true);


--
-- TOC entry 12 (OID 17427)
-- Name: software_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hubert
--

SELECT pg_catalog.setval('software_id_seq', 774, true);


SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 13 (OID 17432)
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 9, true);


SET SESSION AUTHORIZATION 'hubert';

--
-- TOC entry 14 (OID 17437)
-- Name: room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hubert
--

SELECT pg_catalog.setval('room_id_seq', 159, true);


SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 15 (OID 19353)
-- Name: dept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dept_id_seq', 48, true);


--
-- TOC entry 3 (OID 2200)
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


