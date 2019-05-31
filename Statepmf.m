%Matrix diagonalization for state pmf

%Google pagerank example
P=[0.03 0.455 0.455 0.03 0.03
.2 .2 .2 .2 .2
0.3133 0.3133 0.03 0.3133 0.0301
0.03 0.03 0.03 0.03 0.88
0.03 0.03 0.455 0.03 0.455];


Q = P - eye(length (P))
Q(:,1)=1;

b=[1 0 0 0 0];
p=b*inv(Q) 