function histogram(image,plot1,plot2)
%%
if(ndims(image) == 3)
    display('This is RGB Image')
    f = rgb2gray(image);
else
    f = image;
end 
h=imhist(f);
h1=h(1:10:256);
horz=1:10:256;
bar(plot1,horz,h1)
%axis([0 255 0 5000])
%histogram normlization
hnorm=imhist(f)/numel(f)
c=cumsum(hnorm)
x=linspace(0,1,256);
plot(plot2,x,c)
%%

