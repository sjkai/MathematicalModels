x = sdpvar(2,1);
F = [-1 <= x <= 1];
obj = sum(x);
optimize(F,obj);
optobj = value(obj)
optx = value(x)
