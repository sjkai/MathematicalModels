function [D,path,min1,path1]=floyd(S,E,W,start,terminal)
D=sparse(S,E,W);

D=full(D);
[ra,co]=size(D);
A=zeros(1,max(ra,co));
D=[D;A];
D=D+D';
D(find(D==0))=inf;

n=size(D,1);path=zeros(n,n);
for i=1:n
   for j=1:n
      if D(i,j)~=inf
         path(i,j)=j;
end,  end, end
for k=1:n
   for i=1:n
      for j=1:n
         if D(i,k)+D(k,j)<D(i,j)
            D(i,j)=D(i,k)+D(k,j);
            path(i,j)=path(i,k);
end, end, end,end
if nargin==5
   min1=D(start,terminal);
   m(1)=start;
   i=1;
   path1=[ ];   
   while   path(m(i),terminal)~=terminal
      k=i+1;                                
      m(k)=path(m(i),terminal);
      i=i+1;
   end
   m(i+1)=terminal;
   path1=m;
end   
