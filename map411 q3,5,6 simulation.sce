//Question 3, 5, et 6
clear;
//espace
J = 50 ; dx = 1.0/J ; 
xx = linspace(dx,1,J) ; //pour la graphe

//temps
T = 1 ; dt = 0.0001; 
Niter = T/dt ; 

//La Distribution Initiale
// Si on utilise les deux distributions suivants, ne trace pas 
// la solution exacte et les erreurs (lignes 79-96)

//uu0 = ones(1,J).*rand(1,J);//une distribution random
//uu0 = ones(1,J); //une distribution uniforme

uu0 = (1-cos(2*%pi*xx)) //la distribution initiale de question 4
uu = uu0 ; 

// Les coefficients
alpha = 1; //coefficient de destruction
D = 1; //coefficient de diffusion
V = 1; //coefficient d'advection

disp ("alpha = ");
disp (alpha);
disp ("D = ");
disp (D);
disp ("V = ");
disp (V);

//Les Probabilités
pdest = alpha*dt; //de destruction
pminus = D*dt/dx/dx; //d'aller à j-1
pplus =  V*dt/dx+pminus; //d'aller à j+1
prest = 1-pdest-pplus-pminus;  //de rester à j

disp ("P(destruction) = ");
disp (pdest);
disp ("P(j-1) = ");
disp (pminus);
disp ("P(j+1) = ");
disp (pplus);
disp ("P(j) = ");
disp (prest);

if (prest>=0) then //Si la condition CFL est satisfait
    //Shifters
    iiL = [2:J 1] ; 
    iiR = [J 1:J-1] ; 
    
    //chaque pas du temps
    for n = 1:Niter;
        uu = prest*uu + pplus*uu(iiR)+pminus*uu(iiL);
        
        // Question 4 et 5 : La solution explicite
        // n*dt=t est un pas du temps
        sol = (1-cos(2*%pi*(V*n*dt-xx))*exp(-4*%pi^2*D*n*dt))*exp(-alpha*n*dt); 
        erreur=sol-uu;
        differencelinf(1,n) = norm(erreur,'inf'); 
        differencel2(1,n)=norm(erreur,2); 
        
        //Question 6: decommenter pour les conditions aux bords
        //Ensuite, mets en commentaire la solution explicite, 
        //l'erreur et les lignes 79-96
        //uu(1,1) = 0;
        //uu(J) = uu(J-1);

        //On trace la graphe pour chaque 10eme pas
        if (modulo(n,10)==0)
            drawlater() ; 
            clf ; 

            subplot(2,2,1);
            plot2d(xx,uu,rect=[0,0,1,2]) ; 
            xtitle( 'Simulation', 'Espace', 'Probabilité Densité' ) ;

            subplot(2,2,2);
            plot2d(xx,sol,rect=[0,0,1,2],style=5);
            xtitle( 'Solution', 'Espace', 'Probabilité Densité' ) ;
            
            //Trace d'erreur : 
            // En bleu : l'erreur absolu, 
            // En vert: maximum atteint pour la norme
            subplot(2,2,3);
            plot2d(xx,erreur,rect=[0,0,1,0.004],style=2);
            plot2d(xx,ones(1,J)*max(differencelinf),rect=[0,0,1,0.002],style=3);
            h1=legend(['Erreur Absolu', 'Max(Linf norme)'],1);
            xtitle( 'Erreur avec Linf borne', 'Espace', 'Probabilité Densité' ) ;

            subplot(2,2,4);
            plot2d(xx,erreur,rect=[0,0,1,0.02],style=2);
            plot2d(xx,ones(1,J)*max(differencel2),rect=[0,0,1,0.01],style=3);
            h1=legend(['Erreur Absolu', 'Max(L2 norme)'],1);
            xtitle( 'Erreur avec L2 borne', 'Espace', 'Probabilité Densité' ) ;

            drawnow();
        end
    end
    
    disp ("Max Linf Erreur: ")
    disp(max(differencelinf));
    disp ("Max L2 Erreur: ")
    disp(max(differencel2));

else 
    disp("Erreur : P(j)<0, condition CFL pas satisfait!")
end
