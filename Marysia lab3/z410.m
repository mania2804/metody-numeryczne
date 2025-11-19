clear all; close all; clc;
A=[1 2 5; 3 4 7; 7 8 10];
b=[5; 11; 10]

[Q R]= qr(A);
Q
R

Rx=Q' *b

x=R\Rx

