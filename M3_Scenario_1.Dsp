V2.0;;;
1	ELEMENT	 	NODE_S	646	227	0	sourcebus	660	227	660	227	 	 	 	 
2	ELEMENT	 	NODE_S	646	600	0	txbus	660	600	660	600	 	 	 	 
3	ELEMENT	 	NODE_S	646	406	0	txfromsource	660	406	660	406	 	 	 	 
4	LINE	Phases=--	 	0	0	0	Line_0	660	227	660	406	sourcebus.1.2.3	txfromsource.1.2.3	660,227;660,406;660,406--2	 
5	ELEMENT	Phases=1--	TRANSFORMER_YY	660	406	0	Xfmr_0	660	406	660	600	txfromsource.1.2.3	txbus.1.2.3	 	 
6	ELEMENT	 	NODE_S	271	791	0	load_3	285	791	285	791	 	 	 	 
7	ELEMENT	 	NODE_S	177	790	0	load_2	191	790	191	790	 	 	 	 
8	ELEMENT	 	NODE_S	365	792	0	load_4	379	792	379	792	 	 	 	 
9	ELEMENT	 	NODE_S	445	792	0	load_5	459	792	459	792	 	 	 	 
10	ELEMENT	 	NODE_S	535	791	0	load_6	549	791	549	791	 	 	 	 
11	ELEMENT	 	NODE_S	743	791	0	inverter_1	757	791	757	791	 	 	 	 
12	ELEMENT	 	NODE_S	856	789	0	inverter_2	870	789	870	789	 	 	 	 
13	LINE	Phases=1--	 	660	600	0	Line_2	660	600	191	790	txbus.1	load_2.1	660,600;191,790;191,790--2	 
14	LINE	Phases=1--	 	660	600	0	Line_3	660	600	285	791	txbus.1	load_3.1	660,600;285,791;285,791--2	 
15	LINE	Phases=1--	 	660	600	0	Line_4	660	600	379	792	txbus.1	load_4.1	660,600;379,792;379,792--2	 
16	LINE	Phases=1--	 	660	600	0	Line_5	660	600	459	792	txbus.1	load_5.1	660,600;459,792;459,792--2	 
17	LINE	Phases=1--	 	660	600	0	Line_6	660	600	549	791	txbus.1	load_6.1	660,600;549,791;549,791--2	 
18	LINE	Phases=1--	 	660	600	0	Line_7	660	600	757	791	txbus.1	inverter_1.1	660,600;757,791;757,791--2	 
19	LINE	Phases=1--	 	660	600	0	Line_8	660	600	870	789	txbus.1	inverter_2.1	660,600;870,789;870,789--2	 
20	ELEMENT	 	NODE_S	743	889	0	inverter_load_1	757	889	757	889	 	 	 	 
21	LINE	Phases=1--	 	757	791	0	Line_9	757	791	757	889	inverter_1.1	inverter_load_1.1	757,791;757,889;757,889--2	 
22	ELEMENT	 	NODE_S	856	889	0	inverter_load_2	870	889	870	889	 	 	 	 
23	LINE	Phases=1--	 	870	789	0	Line_10	870	789	870	889	inverter_2.1	inverter_load_2.1	870,789;870,889;870,889--2	 
24	ELEMENT	 	NODE_S	101	789	0	load_1	115	789	115	789	 	 	 	 
25	LINE	Phases=1--	 	0	0	0	Line_1	660	600	115	789	txbus.1	load_1.1	660,600;115,789;115,789--2	 
