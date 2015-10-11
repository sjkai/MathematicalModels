function dy=exam00(t,y)
    dy=zeros(3,1);
    dy(1)=(y(3)+y(2)-14.173)*y(1)-0.1*y(1)^2;
    dy(2)=0.9*(27-y(1));
    dy(3)=0.9*(y(2)-3.5); 
end
