function rgbPic = get_pic(savanna)
    
    rgbPic = zeros(size(savanna,1),size(savanna,2),3);
    
    % GRASS
    rgbPic = recolor(rgbPic, find(savanna == 0), 158/255, 149/255, 56/255);
    
    % YOUNG & ADULT PINE
    rgbPic = recolor(rgbPic, find(savanna == 1), 0, .8, 0);
    rgbPic = recolor(rgbPic, find(savanna == 2), 0, .4, 0);
    
    % YOUNG & ADULT HARDWOOD TREE
    rgbPic = recolor(rgbPic, find(savanna == 3), 0, 0, .8);
    rgbPic = recolor(rgbPic, find(savanna == 4), 0, 0, .4);
    
    % HURRICANE
    rgbPic = recolor(rgbPic, find(savanna == 5), .5, .5, .5);
    
end

function rgbPic = recolor(rgbPic, ind, r, g, b)
    rgbPic(ind) = r;
    rgbPic(2500 + ind) = g;
    rgbPic(5000 + ind) = b;
end
