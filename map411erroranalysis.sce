Npart = 1;

//time spacing
T = 1 ; dt = 0.0000005; 
Niter = T/dt ; 

//space spacing
J = 60 ; dx = 1/J ;
xx = linspace(dx,1,J) ; //useful for plotting

    // probabilities
    alpha = 1; //coeff destruction
    D = 1; //coeff diffusion
    V = 1; //coeff advection
    pdest = alpha*dt; //destruction
    pminus = D*dt/dx/dx; //goes to j-1
    pplus =  V*dt/dx+pminus; //goes to j+1
    prest = 1-pdest-pplus-pminus;  //stays at j



rownumb=1;
while (prest>=0)//condition CFL satisfait
    if (rownumb >15)
        break
    end 

    //initial conditions
    uu0 = (1-cos(2*%pi*xx))*Npart/2 //int distribution
    uu = uu0 ; 
  
    pdest = alpha*dt; //destruction
    pminus = D*dt/dx/dx; //goes to j-1
    pplus =  V*dt/dx+pminus; //goes to j+1
    prest = 1-pdest-pplus-pminus;  //stays at j


    //Shifters
    iiL = [2:J 1] ; //shifts left so is the part coming from right
    iiR = [J 1:J-1] ; 
    
    //for each step in time
    for n = 1:Niter;
        uu = prest*uu + pplus*uu(iiR)+pminus*uu(iiL);
        if (n>2000)
            break
        end
        sol = (1-cos(2*%pi*(V*n*dt-xx))*exp(-4*%pi^2*D*n*dt))*exp(-alpha*n*dt)*Npart/2; //n*dt=t is time step
        erreur=sol-uu;
        differencelinf(1,n) = norm(erreur,'inf');
        differencel2(1,n)=norm(erreur,2);
    end

    disp ("Npart")
    disp(Npart);
    disp ("dt")
    disp(dt);
    disp ("dx")
    disp(dx);

    disp ("Max Linf Erreur: ")
    disp(max(differencelinf));
    disp ("Max L2 Erreur: ")
    disp(max(differencel2));

    dt=dt+0.000025;

    stockt(1,rownumb)=dt;
    stocklinf(1,rownumb)=max(differencelinf);
    stockl2(1,rownumb)=max(differencel2);
    rownumb=rownumb+1;

end

