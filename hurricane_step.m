function savanna = hurricane_step(savanna)

     for i = 1:size(savanna,1)
        for j = 1:size(savanna,2)
            if savanna(i,j) == 2 && rand() < .8
                savanna(i,j) = 5;
            elseif savanna(i,j) == 4 && rand() < .8
                savanna(i,j) = 5;
            end
        end
    end
end