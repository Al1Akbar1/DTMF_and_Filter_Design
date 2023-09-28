function [outputArg1] = Decrypt(inputVoice)
    resault=Func2(inputVoice);
    for i=0:length(resault)/8-1
        for j=1:8
            temp(j)=resault(i*8+j); 
        end
        strbin=int2str(temp);
        strdec=bin2dec(strbin);
        disp(char(strdec));
    end
end