function rgbPic = get_pic(savanna, burning_table)
    rgbPic = zeros(size(savanna,1), size(savanna,2),3);
    
    % YOUNG & ADULT PINE
    rgbPic = recolor(rgbPic, find(savanna < get_repr('elder_pine')), 0, .8, 0);
    rgbPic = recolor(rgbPic, find(savanna == get_repr('elder_pine')), 0, .4, 0);
    
    % YOUNG & ADULT HARDWOOD TREE
    rgbPic = recolor(rgbPic, find(savanna >= get_repr('young_hw')), 0, 0, .8);
    rgbPic = recolor(rgbPic, find(savanna == get_repr('elder_hw')), 0, 0, .4);
    
    % GRASS
    rgbPic = recolor(rgbPic, find(savanna == get_repr('grass')), 158/255, 149/255, 56/255);
    
    % HURRICANE
    rgbPic = recolor(rgbPic, find(savanna == get_repr('hurricane')), .5, .5, .5);
    
    % LIGHTNING
    rgbPic = recolor(rgbPic, find(burning_table == get_repr('lightning')), 1, 1, 1);
    
end

function rgbPic = recolor(rgbPic, ind, r, g, b)
    rgbPic(ind) = r;
    rgbPic(2500 + ind) = g;
    rgbPic(5000 + ind) = b;
end
