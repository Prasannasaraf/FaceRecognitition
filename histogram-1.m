clear all;
close all;
clc;
%%
i=imread('du.jpg');
f=i;
h=imhist(f);
h1=h(1:10:256);
horz=1:10:256;
bar(horz,h1)
axis([0 255 0 5000])
%histogram normlization
hnorm=imhist(f)/numel(f)
figure;
c=cumsum(hnorm)
x=linspace(0,1,256);
plot(x,c)
%%

