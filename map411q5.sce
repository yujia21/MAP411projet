Npart = 1;

//space spacing
J = 1/50 ; dx = 1/J ; 
xx = linspace(dx,1,J) ; //useful for plotting

//time spacing
T = 1 ; dt = 0.0001; 
Niter = T/dt ; 

//initial conditions
uu0 = (1-cos(2*%pi*xx))*Npart/2 //int distribution
uu = uu0 ; 

// probabilities
alpha = 1; //coeff destruction
D = 1; //coeff diffusion
V = 1; //coeff advection

disp ("alpha = ");
disp (alpha);
disp ("D = ");
disp (D);
disp ("V = ");
disp (V);

pdest = alpha*dt; //destruction
pminus = D*dt/dx/dx; //goes to j-1
pplus =  V*dt/dx+pminus; //goes to j+1
prest = 1-pdest-pplus-pminus;  //stays at j

disp ("P(destruction) = ");
disp (pdest);
disp ("P(j-1) = ");
disp (pminus);
disp ("P(j+1) = ");
disp (pplus);
disp ("P(j) = ");
disp (prest);

if (prest>=0) then //condition CFL satisfait
    //Shifters
    iiL = [2:J 1] ; //shifts left so is the part coming from right
    iiR = [J 1:J-1] ; 
    
    //for each step in time
    for n = 1:Niter;
        uu = prest*uu + pplus*uu(iiR)+pminus*uu(iiL);
        if (n>2000)
            break
        end
        if (modulo(n,10)==0)//display only each 100th step
            //sol explicite

            sol = (1-cos(2*%pi*(V*n*dt-xx))*exp(-4*%pi^2*D*n*dt))*exp(-alpha*n*dt)*Npart/2; //n*dt=t is time step
            erreur=sol-uu;
            drawlater() ; 
            clf ; 

            subplot(2,2,1);
            plot2d(xx,uu,rect=[0,0,1,Npart]) ; 
            xtitle( 'Simulation', 'Espace', 'Probabilité' ) ;

            subplot(2,2,2);
            plot2d(xx,sol,rect=[0,0,1,Npart],style=5);
            xtitle( 'Solution', 'Espace', 'Probabilité' ) ;
            
            subplot(2,2,3);
            plot2d(xx,(erreur),rect=[0,-0.005,1,0.005],style=3);
            xtitle( 'Erreur', 'Espace', 'Difference en Probabilité' ) ;

            borne = ones(xx)*(dx*dx*10+dt*dt);
            plot2d(xx,borne,rect=[0,-0.005,1,0.005],style=2);

            drawnow();

            disp("Time: ");
            disp(n);

            differencelinf(1,n) = norm(erreur,'inf');
            differencel2(1,n)=norm(erreur,2);
        end
    end
    
    disp ("Max Linf Erreur: ")
    disp(max(differencelinf));
    disp ("Max L2 Erreur: ")
    disp(max(differencel2));

else 
    disp("Erreur : P(j)<0, condition CFL pas satisfait!")
end

