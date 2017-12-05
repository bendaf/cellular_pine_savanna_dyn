function burning_table = burning_step(savanna, burning_table, g_p_interaction)

    for k = 1:3
        for i = 1:size(savanna,1)
            for j = 1:size(savanna,2)
                if burning_table(i,j) < get_repr('lightning')
                    cis = max(1,i-1):min(size(savanna,1),i+1);
                    cjs = max(1,j-1):min(size(savanna,2),j+1);
                    burning_table(i,j) = calc_burning(savanna(i,j), ...
                        burning_table(cis,cjs), g_p_interaction);
                end
            end
        end
        for i = size(savanna,1):-1:1
            for j = size(savanna,2):-1:1
                if burning_table(i,j) < get_repr('lightning')
                    cis = max(1,i-1):min(size(savanna,1),i+1);
                    cjs = max(1,j-1):min(size(savanna,2),j+1);
                    burning_table(i,j) = calc_burning(savanna(i,j), ...
                        burning_table(cis,cjs), g_p_interaction);
                end
            end
        end
    end
end

function burning = calc_burning(state, bngbrhd, g_p_interaction)
    hasBurning = ~isempty(find(bngbrhd >= get_repr('lightning'), 1));
    burning = 0;
    if hasBurning
        r = rand();
        % grass -> burning grass: 0.4, pine -> burning pine: 0.1, 
        % hardwood -> burning hardwood: 0.05
        if state == get_repr('grass')
            if r < 0.4*g_p_interaction
                burning = get_repr('burning');
            end
        elseif state <= get_repr('elder_pine')
            if r < 0.1*g_p_interaction
                burning = get_repr('burning');
            end
        elseif state <= get_repr('elder_hw')
            if r < 0.05*g_p_interaction
                burning = get_repr('burning');
            end
        end
    end
end