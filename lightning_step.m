function savanna = lightning_step(savanna, lightning_intensity)
    lightning_num = poissrnd(lightning_intensity);
    rng('shuffle');
    vec = randperm(numel(savanna));
    savanna = zeros(size(savanna));
    savanna(vec(1:lightning_num+1)) = get_repr('lightning');
end