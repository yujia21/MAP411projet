clear;
Npart = 1;

//espace
J = 50 ; dx = 1/J ; 
xx = linspace(dx,1,J) ; //pour la graphe

//temps
T = 1 ; dt = 0.0001; 
Niter = T/dt ; 

//les conditions initiales
uu0 = (1-cos(2*%pi*xx))*Npart/2 //la distribution initiale
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
        
        //La solution explicite
        sol = (1-cos(2*%pi*(V*n*dt-xx))*exp(-4*%pi^2*D*n*dt))*exp(-alpha*n*dt)*Npart/2; //n*dt=t est un pas du temps
            
        erreur=sol-uu;
        differencelinf(1,n) = norm(erreur,'inf'); 
        differencel2(1,n)=norm(erreur,2); 

        //On trace la graphe pour chaque 10eme pas
        if (modulo(n,10)==0)
            drawlater() ; 
            clf ; 

            subplot(2,2,1);
            plot2d(xx,uu,rect=[0,0,1,Npart]) ; 
            xtitle( 'Simulation', 'Espace', 'Probabilité' ) ;

            subplot(2,2,2);
            plot2d(xx,sol,rect=[0,0,1,Npart],style=5);
            xtitle( 'Solution', 'Espace', 'Probabilité' ) ;
            
            //Trace d'erreur : 
            // En bleu : l'erreur absolu, 
            // En vert: maximum atteint pour la norme
            subplot(2,2,3);
            plot2d(xx,erreur,rect=[0,0,1,0.002*Npart],style=2);
            plot2d(xx,ones(1,J)*max(differencelinf),rect=[0,0,1,0.002*Npart],style=3);
            xtitle( 'Erreur avec Linf borne', 'Espace', 'Probabilité' ) ;

            subplot(2,2,4);
            plot2d(xx,erreur,rect=[0,0,1,0.002*Npart],style=2);
            plot2d(xx,ones(1,J)*max(differencel2),rect=[0,0,1,0.01*Npart],style=3);
            xtitle( 'Erreur avec L2 borne', 'Espace', 'Probabilité' ) ;

            drawnow();
            if (n == 500)
                halt;
            end
        end
    end
    
    disp ("Max Linf Erreur: ")
    disp(max(differencelinf));
    disp ("Max L2 Erreur: ")
    disp(max(differencel2));

else 
    disp("Erreur : P(j)<0, condition CFL pas satisfait!")
end
