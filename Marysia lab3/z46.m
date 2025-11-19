clc; close all; clear all;

function x = fCramer(A,b)
[M,N] = size(A); x = zeros(M,1);
for k=1:N
Ak=A; Ak(:,k)=b;
x(k) = det( Ak) / det(A);
end
end


A=[3 8 1; -4 1 1; -4 1 1];
%A=A+0.01*randn(size(A));  %dodajemy szum
b=[5;11;10];

fCramer(A,b)

x1=inv(A)*b

x2=A\b

x3=pinv(A)*b

err =max(abs(x1-x2))

det(A)