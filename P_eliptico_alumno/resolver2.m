function [U,k]=resolver2(A,b,L1,L2,xo)
%Resuelve AU=b mediante gradiente conjugado precondicionado con la diagonal de A
%todos los vectores son filas

e=1e-10;
f=1e-10;
m=length(b);

x=xo;
r=b - producto(A,xo,L1,L2);
R=m_diagonal(A,L1,r);
d=R;
c=dot(R,r);
for k=1:m
    if dot(d,d)<f
        break;
    end
    z=producto(A,d,L1,L2);
    a=c/dot(d,z);
    x=x+a*d;
    r=r-a*z;
    R=m_diagonal(A,L1,r);
    p=dot(R,r);%Algoritmo original de Fletcher-Reeves
    if dot(r,r)<e
        break;
    end
    d=R+(p/c)*d;
    c=p;
end
U=x;