function new_savanna = step(savanna, burning_table)
    new_savanna = savanna;
    for i = 1:size(savanna,1)
        for j = 1:size(savanna,2)
            is = max(1,i-4):min(size(savanna,1),i+4);
            js = max(1,j-4):min(size(savanna,2),j+4);
            cis = max(1,i-1):min(size(savanna,1),i+1);
            cjs = max(1,j-1):min(size(savanna,2),j+1);
            new_savanna(i,j) = calc_state(savanna(i,j), savanna(is,js), ...
                savanna(cis,cjs), burning_table(i,j));
        end
    end
end
