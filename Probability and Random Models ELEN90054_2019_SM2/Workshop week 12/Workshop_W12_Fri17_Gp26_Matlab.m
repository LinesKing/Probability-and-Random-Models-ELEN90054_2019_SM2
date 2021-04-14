clear all
close all
clc

%% Q1
%%(a)
%(i)
pi = poisscdf(699,600,'upper');
%(ii)
pi_ = qfunc(4.0825);
%%(b)
%(i)
Pii = gamcdf(60,700,0.1);