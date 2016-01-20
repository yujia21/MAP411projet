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


//dt = 0.000175
y9 = [0.0012206743856715274	0.0012989953087039208	0.0013887835185122377	0.00149323118984801	0.0016112138971896561	0.001756614613127705	0.001924545790758958	0.002129997358773894	0.0023809243073396047	0.002686933082043874
]
y10 = [0.0072213495312066535	0.007407494451004264	0.00760992603609615	0.007830478776942835	0.008070939905070152	0.008332672547185805	0.00861571116433495	0.008916627711157293	0.00922321029665901	0.009500247790684981
]
subplot(2,2,1);
plot2d(log(xx),log(y9));
plot2d(log(xx),log(xx)*0.75-3.47,style=2);
xtitle( 'Changement dx, Norme L inf, dt = 0.000175', 'log(dx)', 'log(erreur)') ;
h1=legend(['log(erreur))', 'log(dx)*0.75-3.47'],4);

subplot(2,2,2);
plot2d(log(xx),log(y10));
plot2d(log(xx),log(xx)*0.2-4,style=2);
xtitle( 'Changement dx, Norme L 2, dt = 0.000175', 'log(dx)', 'log(erreur)') ;
h2=legend(['log(erreur))', 'log(dx)*0.2-4'],4);

//dt = 0.0002
y11 = [0.0012297642632779215	0.0013081577530864585	0.0013977863971063043	0.0015023585661881889	0.0016204737046137119	0.0017656347026682173	0.001933735235159162	0.002139100280402817	0.0023899733480239327	0.0026958192755204835
]
y12 = [0.0072752392907017745	0.007459381064843597	0.007659729060460224	0.007878107782045124	0.008116290171464922	0.008375619788687795	0.008656108671629525	0.008954293387163106	0.00925790892848225	0.009531657590927702
]
subplot(2,2,3);
plot2d(log(xx),log(y11));
plot2d(log(xx),log(xx)*0.75-3.47,style=2);
xtitle( 'Changement dx, Norme L inf, dt = 0.0002', 'log(dx)', 'log(erreur)') ;
h3=legend(['log(erreur))', 'log(dx)*0.75-3.47'],4);

subplot(2,2,4);
plot2d(log(xx),log(y12));
plot2d(log(xx),log(xx)*0.2-4,style=2);
xtitle( 'Changement dx, Norme L 2, dt = 0.0002', 'log(dx)', 'log(erreur)') ;
h4=legend(['log(erreur))', 'log(dx)*0.2-4'],4);
