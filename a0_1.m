c=[3 8 2 10 3;8 7 2 9 7;6 4 2 7 5;8 4 2 3 5;9 10 6 9 10];
x=binvar(5,5);
obj=sum( sum(c.*x) );
F=[];
for i=1:5
    F=[F sum(x(i,:))==1];
end
optimize(F,obj)
value(obj);
value(x)
