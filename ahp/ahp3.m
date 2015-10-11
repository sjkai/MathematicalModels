function res=ahp3(layer2,layer3,wl3ri)
    [r,c]=size(layer3);
    WL3RI=wl3ri;
    WL3=1:r;
    WL3=WL3';
    for i=layer3
        c=g2c(i');
        w=c2w(c,WL3RI);
        WL3=[WL3 w];
    end
    WL3(:,1)=[];
    c=g2c(layer2);
    [m,n]=size(c);
    WL2RI=ri(6);
    WL2=c2w(c,WL2RI);
    res=WL3*WL2;
end
