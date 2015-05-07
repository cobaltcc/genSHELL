function NODE_NUMBER=findNode(NODES,node_xyz)

for i=1:size(NODES,1)
   OUTPUT =  NODES(i, [2,3,4]) ==  node_xyz;
   if sum(OUTPUT) == 3
       NODE_NUMBER = i;
       break
   end
end

end