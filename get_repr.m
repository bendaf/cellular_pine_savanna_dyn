function code = get_repr(type)
    %  code = get_repr(type)
    %  The representation of the different type of fields.
    %  0:    grass
    %  1-21  pine with age 1-21+ 
    %  22-43 hardwood with age 1-21+
    %  44    lighting
    %  45    burning
    %  46    destroyed by hurricane
    young_plant_age = 4;
    if strcmp(type, 'grass')
        code = 0;
    elseif strcmp(type, 'young_pine')
        code = 1;
    elseif strcmp(type, 'young')
        code = young_plant_age;
    elseif strcmp(type, 'elder_pine')
        code = young_plant_age+1;
    elseif strcmp(type, 'young_hw')
        code = young_plant_age+2;
    elseif strcmp(type, 'elder_hw')
        code = young_plant_age*2+2;
    elseif strcmp(type, 'lightning')
        code = young_plant_age*2+3;
    elseif strcmp(type, 'burning')
        code = young_plant_age*2+4;
    elseif strcmp(type, 'hurricane')
        code = young_plant_age*2+5;
    else
        error 'wrong type';
    end
end