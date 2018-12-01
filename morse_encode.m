function morse = morse_encode(message, table) 
% Encodes a message from ASCII to Morse code, with separators for letters and words
    
    %%% TODO: Create a central store for conversion tables %%%
    
    if ~(exist('table', 'var')) 
        % disp('No table')
        table = {
        '-.-.--', '.?..?.', '', '', ...                  % symbols !"#$
        '', '', ...                                      % symbols %&
        '.????.', '?.??.', ...                         % symbols '(
        '?.??.?', '', '.-.-.', '--..--', ...            % symbols )*+,
        '-....-', '.-.-.-', '-..-.', ...                 % symbols -./
        '-----', '.----', '..---', '...--', '....-', ... % numbers 0-4
        '.....', '-....', '--...', '---..', '----.', ... % numbers 5-9
        '---...', '', '', '-...-', ...                   % symbols :;<=
        '', '..--..', '.--.-.', ...                      % symbols >?@
        '.-', '-...', '-.-.', '-..', ...                 % ABCD
        '.', '..-.', '--.', '....', ...            % EFGH
        '..', '.---', '-.-', '.-..',  ...               % IJKL
        '--', '-.', '---', '.--.', ...                   % MNOP
        '--.-', '.-.', '...', '-', ...                   % QRST
        '..-', '...-', '.--', '-..-', ...                % UVWX
        '-.--', '--..', ...                              % YZ
        '', '', '', '', '', '', ...                      % symbols [\]^_`
        '.-', '-...', '-.-.', '-..', ...                 % abcd
        '.', '..-.', '--.', '....', ...                  % efgh
        '..', '.---', '-.-', '.-..', ...                 % ijkl
        '--', '-.', '---', '.--.', ...                   % mnop
        '--.-', '.-.', '...', '-', ...                   % qrst
        '..-', '...-', '.--', '-..-', ...                % uvwx
        '-.--', '--..', ...                              % yz
        '', '', '', ''  ...                              % symbols {|}~
        };
    end
    
    if ~(exist('word_spacing', 'var'))
        word_spacing = ' ';
    end
    
    if ~(exist('letter_spacing', 'var'))
        letter_spacing = '|';
    end
    
    morse = '';
    for k = 1:length(message)
        if char(message(k)) > 32 && char(message(k)) < 127
            [morse] = [morse, table{message(k) - 32},  letter_spacing];
        elseif message(k) == ' '
            [morse] = [morse(1:end-1), word_spacing];
        end
    end
    
    morse = morse(1:end-1);
end