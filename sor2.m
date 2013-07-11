% SOR method using matrices
clear all
clc
A=[4 3 0;3 4 -1;3 -1 4];
b=[24;32;-24];
D=diag(diag(A));
R=A-D;
L=tril(A)-D;
U=triu(A)-D;
Tj=-inv(D)*R;
w=2/(1+sqrt(1-(max(eig(Tj)))^2));
c=(D+(w*L))\(w*b);
Tw=-(D+(w*L))\((w*U)+(w-1)*D);
x=[1;1;1];
tol=0.0001;
for k=1:1000
    x(:,k+1)=Tw*x(:,k)+c
    if abs(x(:,k+1)-x(:,k))<tol
    break
end
end
x