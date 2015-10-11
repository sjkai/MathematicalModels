function z=QCluser(gj)
    gj=zscore(gj);
    y=pdist(gj);
    z=linkage(y,'average');
    dendrogram(z)
end
