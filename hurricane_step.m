function savanna = hurricane_step(savanna)
     for i = 1:size(savanna,1)
        for j = 1:size(savanna,2)
            if savanna(i,j) == get_repr('elder_pine')
                if rand() < 0.8
                    savanna(i,j) = get_repr('hurricane');
                end
            elseif savanna(i,j) == get_repr('elder_hw') 
                if rand() < .8
                    savanna(i,j) = get_repr('hurricane');
                end
            end
        end
    end
end