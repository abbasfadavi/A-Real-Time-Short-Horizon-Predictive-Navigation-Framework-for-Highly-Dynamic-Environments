function r = my_randi
global lfsr
    %persistent lfsr;
    % if isempty(lfsr)
    %     lfsr = uint32(123456789);
    % end
    
    feedback = bitxor(bitget(lfsr, 32), bitget(lfsr, 22));
    feedback = bitxor(feedback, bitget(lfsr, 2));
    feedback = bitxor(feedback, bitget(lfsr, 1));
    lfsr = bitshift(lfsr, 1);
    lfsr = bitset(lfsr, 1, feedback);
    r_temp = bitand(lfsr, 511);
    r_temp = round((r_temp)/2^5);
    
    switch r_temp
        case 0
            r = -2;
        case 1
            r = -1;
        case 2
            r = 0;
        case 3
            r = 1;
        case 4
            r = 2;
        case 5
            r = -2;
        case 6
            r = -1;
        case 7
            r = 0;
        case 8
            r = 1;
        case 9
            r = 2;
        case 10
            r = -2;
        case 11
            r = -1;
        case 12
            r = 0;
        case 13
            r = 1;
        case 14
            r = 2;
        otherwise
            r = 0;
    end
end