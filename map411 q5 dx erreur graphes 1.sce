// Question 5, Analyse d'erreur : dx et Np
// On varie dx en tenant dt constante. 
// dx erreur graphes 1 : dt = 0.0000075, 0.00001
// dx erreur graphes 2 : dt = 0.0000125, 0.000015
// dx erreur graphes 3 : dt = 0.0000175, 0.00002
// Ensuite, on trace le log de dx et de l'erreur pour trouver 
// une borne. 

clf;
//dx
xx = [0.0142857,
0.0153846,
0.0166667,
0.0181818,
0.02,
0.0222222,
0.025,
0.0285714,
0.0333333,
0.04
]

//dt = 0.000075
y5 = [
0.0014317220686725918,
0.0015106442889790683,
0.0016000499794150969,
0.0017033849886675112,
0.001824415493178022,
0.0019657429994362485,
0.0021361268003863287,
0.0023395842437810566,
0.0025892702265438716,
0.002891530026886746
]

y6 = [0.008471475226649318,
0.008610881789630823,
0.008764737086020897,
0.008934622955635262,
0.009122008744269942,
0.009327841477590443,
0.009551601045828305,
0.00978908608154019,
0.010026886697975168,
0.010227811788671175
]

subplot(2,2,1);
plot2d(log(xx),log(y5));
plot2d(log(xx),log(xx)*0.75-3.35,style=2);
xtitle( 'Changement dx, Norme L inf, dt = 0.000075', 'log(dx)', 'log(erreur)') ;
h3=legend(['log(erreur))', 'log(dx)*0.75-3.35'],4);

subplot(2,2,2);
plot2d(log(xx),log(y6));
plot2d(log(xx),log(xx)*0.2-3.91,style=2);
xtitle( 'Changement dx, Norme L 2, dt = 0.000075', 'log(dx)', 'log(erreur)') ;
h4=legend(['log(erreur))', 'log(dx)*0.2-3.86'],4);

//dt = 0.0001
y3 = [0.0015252,
0.0016028,
0.0016933,
0.0017955,
0.0019173,
0.0020580,
0.0022283,
0.0024308,
0.0026800,
0.0029806
]

y4 = [0.0090208,
0.0091396,
0.0092720,
0.0094195,
0.0095835,
0.0097648,
0.0099624,
0.0101720,
0.0103796,
0.0105472
]

subplot(2,2,3);
plot2d(log(xx),log(y3));
plot2d(log(xx),log(xx)*0.75-3.28,style=2);
xtitle( 'Changement dx, Norme L inf, dt = 0.0001', 'log(dx)', 'log(erreur)') ;
hl=legend(['log(erreur))', 'log(dx)*0.75-3.28'],4);

subplot(2,2,4);
plot2d(log(xx),log(y4));
plot2d(log(xx),log(xx)*0.2-3.86,style=2);
xtitle( 'Changement dx, Norme L 2, dt = 0.0001', 'log(dx)', 'log(erreur)') ;
h2=legend(['log(erreur))', 'log(dx)*0.2-3.86'],4);

