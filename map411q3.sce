//space spacing
J = 50 ; dx = 1.0/J ; 
xx = linspace(dx,1,J) ; //useful for plotting

//time spacing
T = 1 ; dt = 0.02; 
Niter = T/dt ; 

//initial conditions
uu0 = 1-cos(2*%pi*xx) ; //int distribution
uu = uu0 ; 

// probabilities
pdest = 0.1; //destruction
pplus =  0.4; //goes to j+1
pminus = 0.2; //goes to j-1
prest = 1-pdest-pplus-pminus;  //stays at j

alpha = pdest/dt; //coeff destruction
D = pminus * dx * dx / dt; //coeff diffusion
V = pplus-pminus * dx / dt; //coeff advection

disp ("alpha = ");
disp (alpha);
disp ("D = ");
disp (D);
disp ("V = ");
disp (V);


//Shifters
iiL = [2:J 1] ; //shifts left so is the part coming from right
iiR = [J 1:J-1] ; 

//for each step in time
for n = 1:Niter
    drawlater();
    uu = prest*uu + pplus*uu(iiR)+pminus*uu(iiL)-pdest*uu;
    clf;
    plot2d(xx,uu,rect=[0,0,1,2]) ; 
//    halt('Press a key') ; 
    drawnow();
end
