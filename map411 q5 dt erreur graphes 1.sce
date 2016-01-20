// Question 5, Analyse d'erreur : dt
// On varie dt en tenant dx (c'est à dire, 1/J) constante. 
// dt erreur graphes 1 : J = 60, 50
// dt erreur graphes 2 : J = 40, 30
// Ensuite, on trace le log de dt et de l'erreur pour trouver 
// une borne. 

clf;
tt = [2.55E-5	5.05E-5	7.55E-5	1.005E-4	1.2550000000000001E-4	1.5050000000000003E-4	1.7550000000000004E-4	2.0250000000000004E-4	2.2750000000000005E-4	2.5500000000000007E-4	2.800000000000001E-4	3.050000000000001E-4	3.300000000000001E-4
]

//dx = 0.016667, J = 60
y1 = [1.4064419464687727E-4	0.0014175958133684219	0.0015087458610011373	0.0016019132909581568	0.0016951708860692971	0.0017885166717848122
]

y2 = [7.711195940054252E-4	0.007769441138931446	0.008270453711899712	0.008774853284657288	0.009282161576396717	0.00979201660285792
]

subplot(2,2,1);
plot2d(log(tt(1:6)),log(y1));
plot2d(log(tt(1:6)),log(tt(1:6))/3-3.2,style=2);
xtitle( 'Changement dt, Norme L 2, dx = 0.016667', 'log(dt)', 'log(erreur)') ;
h4=legend(['log(erreur))', 'log(dt)/3-3.2'],4);


subplot(2,2,2);
plot2d(log(tt(1:6)),log(y2));
plot2d(log(tt(1:6)),log(tt(1:6))/3-1.5,style=2);
xtitle( 'Changement dx, Norme L 2, dx = 0.016667', 'log(dt)', 'log(erreur)') ;
h4=legend(['log(erreur))', 'log(dt)/3-1.5'],4);

//dx = 0.02, J = 50
y3 = [7.02519629685483E-4	0.001648258492946364	0.0017409328901121235	0.0018336955912510167	0.0019265444382414731	0.002019483470933503	0.002112498979733868	0.002205610543432601
]

y4 = [0.0035166661380031483	0.008252546872393239	0.008708839574943866	0.009168051327228248	0.009629821317332185	0.010093858113268156	0.010559942812767328	0.011027809662936922
]

subplot(2,2,3);
plot2d(log(tt(1:8)),log(y3));
plot2d(log(tt(1:8)),log(tt(1:8))/3-3.05,style=2);
xtitle( 'Changement dt, Norme L 2, dx = 0.02', 'log(dt)', 'log(erreur)') ;
h4=legend(['log(erreur))', 'log(dt)/3-3.05'],4);


subplot(2,2,4);
plot2d(log(tt(1:8)),log(y4));
plot2d(log(tt(1:8)),log(tt(1:8))/3-1.43,style=2);
xtitle( 'Changement dx, Norme L 2, dx = 0.02', 'log(dt)', 'log(erreur)') ;
h4=legend(['log(erreur))', 'log(dt)/3-1.43'],4);
