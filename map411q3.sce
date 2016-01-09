Npart = 1; //# de particules

// Espace
J = 50 ; dx = 1.0/J ; 
xx = linspace(dx,1,J) ; //pour la graphe

// Temps
T = 1 ; dt = 0.02; 
Niter = T/dt ; 

// Les conditions initiales
// Pour avoir une densité de probabilité, on enforce une normalization
// de la distribution initiale.

disint = ones(1,J).*rand(1,J);//une distribution random
//disint = ones(1,J); //une distribution uniforme
//disint = 1-cos(2*%pi*xx); //la distribution initiale pour question 4

normalize = sum(disint);
uu0 = disint/normalize * Npart; 

uu = uu0 ; 

// Les probabilités
// Ici on fixe les probabilités et calcule les coefficients.
// Mais si on a les coefficients, on peut calculer
// les probabilités à partir de là.
pdest = 0.1; //destruction
pplus =  0.4; //la particule va à j+1
pminus = 0.2; //la particule va à j-1
prest = 1-pdest-pplus-pminus;  //la particule reste à j

alpha = pdest/dt; //coefficient de destruction
D = pminus * dx * dx / dt; //coefficient de diffusion
V = pplus-pminus * dx / dt; //coefficient d'advection

disp ("alpha = ");
disp (alpha);
disp ("D = ");
disp (D);
disp ("V = ");
disp (V);

//Shift
iiL = [2:J 1] ; //shift à gauche
iiR = [J 1:J-1] ; 

//Pour chaque pas de temps
for n = 1:Niter
    drawlater();
    uu = prest*uu + pplus*uu(iiR)+pminus*uu(iiL);
    clf;
    // La distribution initiales en rouge
    plot2d(xx,uu0,rect=[0,0,1,Npart/10], style = 5) ; 
    
    // La simulation en noir
    plot2d(xx,uu,rect=[0,0,1,Npart/10]) ; 
    drawnow();
end
