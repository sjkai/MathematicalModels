function X=Arrise(x,t)
    add=rand(1,2)-[0.5 0.5];
    add./100;
    X=x+add;
    while X(1)>5 ||X(1)<-5||X(2)>5||X(2)<-5
        add=rand(1,2)-[0.5 0.5];
        add./100;
        X=x+add;
    end
end
