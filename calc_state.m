function new_state = calc_state(state, ngbhd, cngbhd)
    hasPine = ~isempty(find(ngbhd >= get_repr('young_pine') & ...
        ngbhd <= get_repr('elder_pine'), 1));
    hasHw = ~isempty(find(cngbhd >= get_repr('young_hw') & ...
        cngbhd <= get_repr('elder_hw'), 1));
    
    % grass -> pine, grass -> hardwood, pine -> hardwood = [.03 .01 .02];
    if state > get_repr('elder_hw')
        state = get_repr('grass'); 
    end
    r = rand();
    if state == get_repr('grass')
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