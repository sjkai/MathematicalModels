function res=ahp3(layer2,layer3)
    [r,c]=size(layer3);
    RI=ri(r);
    WL3=1:r;
    WL3=WL3';
    for i=layer3
        c=g2c(i');
        w=c2w(c,RI);
        WL3=[WL3 w];
    end
    WL3(:,1)=[];
    c=g2c(layer2);
    [m,n]=size(c);
    WL2=c2w(c,ri(n));
    res=WL3*WL2;
end
