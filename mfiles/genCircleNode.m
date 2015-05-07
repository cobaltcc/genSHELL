function [X,Y]=genCircleNode(R,N,DIV)
    
    DRAW_TOL = 5e-6;
    angle=deg2rad((0:360/N:360-360/N)+DIV);
    X=R*cos(angle);
    Y=R*sin(angle);
    %plot(X,Y)
    
    for i = 1:size(X,2)
       
        if abs(X(i)) < DRAW_TOL
            X(i) =0;
       end
       
       if abs(Y(i)) < DRAW_TOL
           Y(i) =0;
       end
           
           
    end
    

end