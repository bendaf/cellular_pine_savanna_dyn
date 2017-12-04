function new_state = calc_state(state, ngbhd, cngbhd, burning)
    hasPine = ~isempty(find(ngbhd >= get_repr('young_pine') & ...
        ngbhd <= get_repr('elder_pine'), 1));
    hasHw = ~isempty(find(cngbhd >= get_repr('young_hw') & ...
        cngbhd <= get_repr('elder_hw'), 1));
    
    % hurricane -> grass: 1
    if state == get_repr('hurricane')
        state = get_repr('grass'); 
    end
    
    % lightning -> burning: 1
    if burning == get_repr('lightning')
        burning = get_repr('burning');
    end
    
    % burning grass -> grass: 1, burning young pine -> young pine: 0.2
    % burning adult pine -> adult pine: 0.8, burning young hardwood ->
    % young hardwood: 0.05, burning adult hardwood -> adult hardwood: 0.1
    r = rand();
    if burning == get_repr('burning')
        new_state = state;
        if state < get_repr('elder_pine') && r < 0.8
            new_state = get_repr('grass');
        elseif state == get_repr('elder_pine') && r < 0.2
            new_state = get_repr('grass');
        elseif state < get_repr('elder_hw') && r < 0.95
            new_state = get_repr('grass');
        elseif state == get_repr('elder_hw') && r < 0.9
            new_state = get_repr('grass');
        end
    
    % grass -> pine: 0.03, grass -> hardwood: 0.01, pine -> hardwood: 0.02;
    elseif state == get_repr('grass')
        new_state = state;
        if r <= .03 && hasPine
            new_state = get_repr('young_pine');
        elseif r <= .04 && r > 0.03 && hasHw
            new_state = get_repr('young_hw');
        end
    elseif state <= get_repr('elder_pine')
        new_state = min(state + 1, get_repr('elder_pine'));
        if hasHw && r < .02
            new_state = get_repr('young_hw');
        end
    elseif state <= get_repr('elder_hw')
        new_state = min(state + 1, get_repr('elder_hw')); 
    end
end