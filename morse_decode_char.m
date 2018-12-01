function ch = morse_decode_char(morse)
% Based on https://stackoverflow.com/questions/28045172/morse-code-converter-in-c#28046691
% Uses a dichotomic search tree to parse each morse sign (* means no character
% is mapped to that combination).

    if length(morse) <= 6
        j = 1;
        for k = 1:length(morse)
            if morse(k) == '.'
                j = 2 * j;
            else
                j = 2 * j + 1;
            end
        end
        
        %%% TODO: create central store for character translation tables %%%
        
        tree = ['*ETIANM' ...   % first (empty), second and third lines of tree
                'SURWDKGO' ...  % fourth line of tree
                'HVF*L*PJ' ...  % first half of fifth line of tree
                'BXCYZQ**' ...  % second half of fifth line of tree
                '54*3***2' ...  % first quarter of sixth line of tree
                '**+****1' ...  % second quarter of sixth line of tree
                '6=/***(*' ...  % third quarter of sixth line of tree
                '7***8*90' ...  % fourth quarter of sixth line of tree
                '********' ...  % first eighth of seventh line of tree
                '****?***' ...  % second eighth of seventh line of tree
                '**"**.**' ...  % third eighth of seventh line of tree
                '**@***''*' ... % fourth eighth of seventh line of tree
                '*-******' ...  % fifth eighth of seventh line of tree
                '*****)**' ...  % sixth eighth of seventh line of tree
                '***,****' ...  % seventh eighth of seventh line of tree
                ':*******'];    % eighth eighth of seventh line of tree 
        ch = tree(j);
    elseif morse == "........"
        ch = '<ERROR>';    % special case: error sign is 8 dits long (........)
    end
    if ch = '*'
        warning(['Invalid Morse sign "', ch, '" on message "', morse, '".']);
    end
end