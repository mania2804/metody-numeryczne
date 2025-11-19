clc; clear all; close all;
u=[1;2;3]
v=[4;5;6]
A=[1,2,3;4,5,6;7,8,9]
B=eye(3)

%operacje na macierzach

a=u' *v
q=u*(v.')
c=A+B
d=A*B
e=(u.')*A
f=A*u
g=10*A

w3=(A+B)*u
w1=A*u+B*u
w2=B*u+A*u

p=inv(A)
b=A*u
u=inv(A)*b

t=poly(A)
r=det(A)
s=rank(A)
w=(u.')*A*u

[V,D]=eig(A)
A=V*D*V'

[U,D,V]=svd(A)
A=U*D*V'