function [eidx] = dfsNextEdge(G,S)
  
%First, sort S from small to big
sort_S = sort(S);

%run a loop across the lenght of S
    for i=1:length(sort_S)
        
        % find the endpoints of S at each ith position
        endpoints = G.Edges.EndNodes(sort_S(i),:);
        endpoints = findnode(G,{endpoints{1} endpoints{2}});
        
        % compare the dfN at those endpoints. If either one or two of the endpoint = -Inf 
        % then it is not discovered yet
        if (G.Nodes.dfN(endpoints(1)) == -Inf) || (G.Nodes.dfN(endpoints(2)) == -Inf)
            
            %return eidx at S(i), then break the loop
            eidx = sort_S(i); 
            
            break
        end
    end

end %end function dfsNextEdge
