function rgbBlock = lbp(rgbBlock,numberOfColorBands,blockSizeR, blockSizeC)
%zero padding

blockSizeR = 64;
blockSizeC = 64;

rgbBlock = [zeros(blockSizeR,1,numberOfColorBands) rgbBlock zeros(blockSizeR,1,numberOfColorBands)];
rgbBlock = [zeros(1,blockSizeC+2,numberOfColorBands); rgbBlock; zeros(1,blockSizeC+2,numberOfColorBands)];



newBlock = zeros(blockSizeR,blockSizeC);

%lbp
for i=2:blockSizeR+1
    for j=2:blockSizeC+1
        I{1} = rgbBlock(i-1,j-1);
        I{2} = rgbBlock(i-1,j);
        I{3} = rgbBlock(i-1,j+1);
        I{4} = rgbBlock(i,j+1);
        I{5} = rgbBlock(i+1,j+1);
        I{6} = rgbBlock(i+1,j);
        I{7} = rgbBlock(i+1,j-1);
        I{8} = rgbBlock(i,j-1);
        
        for k=1:8
            I{k} = I{k} - rgbBlock(i,j);
            if I{k} > 0
                I{k} = 1;
            else
                I{k} = 0;
            end
        end
        newBlock(i-1,j-1) = I{8} + (I{7} * 2) + (I{6} * 2^2) + (I{5} * 2^3) + (I{4} * 2^4) + (I{3} * 2^5) + (I{2} * 2^6) + (I{1} * 2^7); 
    end
end

rgbBlock = histeq(newBlock);
end
