function code = get_repr(type)
    %  code = get_repr(type)
    %  The representation of the different type of fields.
    %  0:    grass
    %  1-21  pine with age 1-21+ 
    %  22-43 hardwood with age 1-21+
    %  44    lighting
    %  45    burning
    %  46    destroyed by hurricane
    young_plant_age = 20;
    code = -1;
    switch type
        case 'grass'
            code = 0;
        case 'young_pine'
            code = 1;
        case 'young'
            code = young_plant_age;
        case 'elder_pine'
            code = young_plant_age+1;
        case 'young_hw'
            code = young_plant_age+2;
        case 'elder_hw'
            code = young_plant_age*2+2;
        case 'lightning'
            code = young_plant_age*2+3;
        case 'burning'
            code = young_plant_age*2+4;
        case 'hurricane'
            code = young_plant_age*2+5;
    end
    if code == -1
        error 'wrong type';
    end
end