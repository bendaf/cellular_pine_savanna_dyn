function new_state = calc_state(state, ngbhd, cngbhd)
    hasPine = sum(find(ngbhd == 2,1)) + sum(find(ngbhd == 1,1));
    hasHw = sum(find(cngbhd == 3,1)) + sum(find(cngbhd == 4,1));
    
    % grass -> pine, grass -> hardwood, pine -> hardwood = [.03 .01 .02];
    new_state = state;
    switch state
        case 0
            r = rand();
            if r <= .03 & hasPine
                new_state = 1;
            elseif r <= .04 && r > 0.03 & hasHw
                new_state = 3;
            end
        case 1
            if hasHw
                new_state = 2*uint8(rand()-.48) + 1;
            end
            if new_state == 1
                new_state = uint8(rand()) + 1;
            end
        case 2
            if hasHw
                new_state = uint8(rand()-.48) + 2;
            end
        case 3
            new_state = uint8(rand()) + 3;
    end
end