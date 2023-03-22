%% update frontier edge
function S_new = updateFrontierEdge(G,S)

%First, sort S from small to big
sort_S = sort(S);


%Start a loop across the length of Nodes of G.
  for i = 1:length(G.Nodes.Name)
 
      % Look for the node with the highest dfN, which is also the newest
      % discovered node
      if (G.Nodes.dfN(i) == max(G.Nodes.dfN))
      
        % Set S_new as the frontier edges from that node. However, this
        % S includes both discovred and undiscovered edges
        [S_new,nV] = outedges(G,G.Nodes.Name(i));
        
        

        end
  end

%Now filter out the discovered edges
%set an empty discovered S for later
discoveredS = [];

%start a loop across the length of the S_new found above
for k = 1:length(S_new)
        
        %locate the endpoints of each edge at each k-th
        endpoints = G.Edges.EndNodes(S_new(k),:);
        endpoints = findnode(G,{endpoints{1} endpoints{2}});
        
        %if the dfN of both of the endpoints of that k-th edge is greater
        %or equal to 0, then that edges is discovred.
        if (G.Nodes.dfN(endpoints(1))>=0) && (G.Nodes.dfN(endpoints(2))>=0)
            
            %call the k-th discovered edge is newS
            newS = (S_new(k));
            
            %append all the discovered edges to discoveredS
            discoveredS(end+1) = [newS];
    
        end
        

end

%use setdiff to extract the undiscovered from S_new vs the discovredS.
S_new = setdiff(S_new, discoveredS);


end % end function updateFrontierEdge


