function foundNODES = searchNODE(NODES,par, min, max)


if (par == 'Z' || par == 'z')

    foundNODES =[];
    tol = 1e-5;

    [row, col] = size(NODES); %NODES = [ID TYPE X Y Z]
    for i=1:row
        if NODES(i,4) < max && NODES(i,4) > min
            foundNODES = [foundNODES;NODES(i,1)];
        end
    end
end



if par == 'R' || par == 'r'

    foundNODES =[];
    tol = 1e-5;

    [row, col] = size(NODES); %NODES = [ID TYPE X Y Z]
    for i=1:row
        R = sqrt(NODES(i,2)^2+NODES(i,3)^2);
        if R < max && R > min
            foundNODES = [foundNODES;NODES(i,1)];
        end
    end

end