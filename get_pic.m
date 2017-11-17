function rgbPic = get_pic(savanna)
    
    rgbPic = zeros(size(savanna,1),size(savanna,2),3);
 
    rgbPic = recolor(rgbPic, find(savanna == 0), 158/255, 149/255, 56/255);
    rgbPic = recolor(rgbPic, find(savanna == 1), 0, .5, 0);
    rgbPic = recolor(rgbPic, find(savanna == 4), 0, 0, .5);
    
    
end

function rgbPic = recolor(rgbPic, ind, r, g, b)
    rgbPic(ind) = r;
    rgbPic(2500 + ind) = g;
    rgbPic(5000 + ind) = b;
end
