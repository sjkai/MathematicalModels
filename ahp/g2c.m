function arr=g2c(W)
   s=size(W);
   s=s(2);
    for i=1:s
        for j=1:s
            arr(i,j)=W(i)/W(j);
        end
    end
end
