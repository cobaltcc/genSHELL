function OUTPUT=searchELEM(TYPE)
    load ELEMENTS
    OUTPUT=[];
    for i=1:size(ELEMENTS,1)
       if ELEMENTS(i,2) == TYPE
          OUTPUT=[OUTPUT; ELEMENTS(i,1)]; 
       end
    end
end