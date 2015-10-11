function [dist,path]=ShortPath(S,E,W,bg,ed)
    DG = sparse(S,E,W);
    ra=size(DG,2);
    DG(ra,ra)=0;
    UG = tril(DG+DG');

    if nargin==5
        h = view(biograph(UG,[],'ShowArrows','off','ShowWeights','on'))
        [dist,path,pred] = graphshortestpath(UG,bg,ed,'directed',false)
        set(h.Nodes(path),'Color',[1 0.4 0.4])
        fowEdges = getedgesbynodeid(h,get(h.Nodes(path),'ID'));
        revEdges = getedgesbynodeid(h,get(h.Nodes(fliplr(path)),'ID'));
        edges = [fowEdges;revEdges];
        set(edges,'LineColor',[1 0 0])
        set(edges,'LineWidth',1.5)
    end

    if nargin==3
        path=0;
        dist=graphallshortestpaths(UG,'directed',false);
    end
end
