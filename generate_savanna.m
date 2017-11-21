function savanna = generate_savanna(pine_ratio, hw_ratio)
    if pine_ratio + hw_ratio > 1 || pine_ratio + hw_ratio < 0
        error 'the sum of pine and hard wood ratio must be between 0 and 1'
    end
    savanna = zeros(50,50,1);
    rng('shuffle');
    vec = randperm(2500);
    pine_end_i = uint64(2500*pine_ratio);
    hw_end_i = uint64(2500*(pine_ratio+hw_ratio));
    savanna(vec(1:pine_end_i)) = uint8(rand(pine_end_i,1)*1)+1;
    savanna(vec(pine_end_i+1:hw_end_i)) = uint64(rand(hw_end_i-pine_end_i,1)*1)+3;
end