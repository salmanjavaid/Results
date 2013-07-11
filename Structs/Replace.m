function y = Replace(str)

    if strcmp(strtrim(str), '---')
        y = 0;
    else
        y = str2num(str);
    end
end