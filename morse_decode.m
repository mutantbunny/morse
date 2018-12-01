function message = morse_decode(morse)
%
    if ~(exist('word_spacing', 'var'))
        word_spacing = ' ';
    end
    
    if ~(exist('letter_spacing', 'var'))
        letter_spacing = '|';
    end
    
    current = '';
    message = '';
    
    for k = 1:length(morse)
        if morse(k) == '.' || morse(k) == '-'
            current = [current, morse(k)];
        elseif morse(k) == letter_spacing
            message = [message, morse_decode_char(current)];
            current = '';
        elseif morse(k) == word_spacing
            message = [message, morse_decode_char(current), ' '];
            current = '';
        else
            warning(['Invalid Morse code "', morse(k), '" on message "', morse, '".']);
        end
    end
    if current
        message = [message, morse_decode_char(current)];
    end
end

