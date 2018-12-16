function morse2wave(morse)
    
    wpm = 20;
    word_length = 50;
    
    dit_duration = 60 / (wpm * word_length); 
    dah_duration = dit_duration * 3;
    
    int_el_duration = dit_duration;
    short_duration = dah_duration;
    medium_duration = dit_duration * 7;
    
    carrier_f = 1000;
    sampling_rate = 22050;
    dt = 1 / sampling_rate;
    
    int_el_samples = floor(int_el_duration  * sampling_rate);
    short_samples = floor(short_duration * sampling_rate);
    medium_samples = floor(medium_duration * 7 * sampling_rate);

    t = 0;
    wave = [];
    
    for i = 1:length(morse)
        if morse(i) == '.'
            dit_wave = sin([t:dt:t+dit_duration - dt] *2*pi*carrier_f);
            wave = [wave dit_wave zeros(1, int_el_samples)];
            t = t + dit_duration + int_el_duration;
            fprintf('Dit: t = %f Length of wave = %d, Time = %f\n', ...
                t, length(wave), t*sampling_rate)
        elseif morse(i) == '-'
            dah_wave = sin([t:dt:t+dah_duration - dt] *2*pi*carrier_f);
            wave = [wave dah_wave zeros(1, int_el_samples)];
            t = t + dah_duration + int_el_duration;
            fprintf('Dah: t = %f Length of wave = %d, Time = %f\n', ...
                t, length(wave), t*sampling_rate)
        elseif morse(i) == '|'
            wave = [wave zeros(1, short_samples - int_el_samples)];
            t = t + short_duration - int_el_duration;
            fprintf('Short space: t = %f Length of wave = %d, Time = %f\n', ...
                t, length(wave), t*sampling_rate)
        elseif morse(i) == ' '
            wave = [wave zeros(1, medium_samples - int_el_samples)];
            t = t + medium_duration - int_el_duration;
            fprintf('Medium space: t = %f Length of wave = %d, Time = %f\n', ...
                t, length(wave), t*sampling_rate)
        end
    end
    sound(wave, sampling_rate);
end
