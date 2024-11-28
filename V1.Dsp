V2.0;;;
1	ELEMENT	 	NODE_S	607	268	0	sourcebus	621	268	621	268	 	 	 	 
2	ELEMENT	 	NODE_S	607	453	0	txfromsource	621	453	621	453	 	 	 	 
3	ELEMENT	 	NODE_S	608	642	0	txbus	622	642	622	642	 	 	 	 
4	ELEMENT	Phases=1--	TRANSFORMER_YY	621	453	0	Xfmr_1	621	453	622	642	txfromsource.1	txbus.1	 	 
5	ELEMENT	 	TRANSFORMER_YY	621	453	0	 	621	453	622	642	txfromsource.1	txbus.1	 	 
6	ELEMENT	 	NODE_S	873	873	0	pv_load1	887	873	887	873	 	 	 	 
7	ELEMENT	 	NODE_S	1084	873	0	pv_storage1	1098	873	1098	873	 	 	 	 
8	ELEMENT	 	NODE_S	1304	873	0	pv_system1	1318	873	1318	873	 	 	 	 
9	LINE	Phases=--	 	621	268	0	Line_5	621	268	621	453	sourcebus.1.2.3	txfromsource.1.2.3	621,268;621,453;621,453--2	 
10	 	 	 	0	0	0	 	0	0	0	0	 	 	 	 
11	LINE	Phases=1--	 	622	642	0	txpvline	622	642	887	873	txbus.1	pv_load1.1	622,642;887,873;887,873--2	 
12	LINE	Phases=1--	 	887	873	0	invertertostorageline	887	873	1098	873	pv_load1.1	pv_storage1.1	887,873;1098,873;1098,873--2	 
13	LINE	Phases=1--	 	1098	873	0	storagetopvline	1098	873	1318	873	pv_storage1.1	pv_system1.1	1098,873;1318,873;1318,873--2	 
14	ELEMENT	 	NODE_S	334	875	0	no_pv_load1	348	875	348	875	 	 	New	 
15	LINE	Phases=1--	 	0	0	0	Line_1	622	642	348	875	txbus.1	no_pv_load1.1	622,642;348,875;348,875--2	 
