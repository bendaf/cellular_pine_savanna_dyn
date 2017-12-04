function distr = calc_distr(savanna)
    distr = zeros(1,3);
    for i = 1:numel(savanna)
        if savanna(i) == get_repr('grass') || savanna(i) == get_repr('hurricane')
            distr(1) = distr(1) + 1;
        elseif savanna(i) <= get_repr('elder_pine')
            distr(2) = distr(2) + 1;
        elseif savanna(i) <= get_repr('elder_hw')
            distr(3) = distr(3) + 1;
        end
    end
    distr = distr./numel(savanna);
end