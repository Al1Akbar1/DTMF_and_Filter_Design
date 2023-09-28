function [dataExtract] = Func2(InputVoiceVector)
    fs=44100;

    %first we have to create three band-filters in 5400 5750 6100 hz

    %%%%%%%%%%%%%%  first filter in 5400 hz %%%%%%%%%%%%%%%%
    [b1,a1] = butter(5,[5350/(fs/2) 5450/(fs/2)],'bandpass');
    

    %%%%%%%%%%%%%%  first filter in 5400 hz %%%%%%%%%%%%%%%%
    [b2,a2] = butter(5,[5700/(fs/2) 5800/(fs/2)],'bandpass');
    

    %%%%%%%%%%%%%%  first filter in 5400 hz %%%%%%%%%%%%%%%%
    [b3,a3] = butter(5,[6050/(fs/2) 6150/(fs/2)],'bandpass');
    

    %%%%%%%%%%%%%%  pass the signal from each filters %%%%%%%%%%%
    filteredSignal1=filter(b1,a1,InputVoiceVector);
    filteredSignal2=filter(b2,a2,InputVoiceVector);
    filteredSignal3=filter(b3,a3,InputVoiceVector);


    
    filteredSignal2=abs(filteredSignal2);
    filteredSignal3=abs(filteredSignal3);
    
    %%%%%%%%%%%% convert sinusoidal to rect pulse for signal1 %%%%%%%%%%%%%
    filteredSignal1=abs(filteredSignal1);
    window=40;
    for i=0:length(filteredSignal1)/window-1
        tempMax=0;
        for j=1:window
            if filteredSignal1(window*i+j)>tempMax
                tempMax=filteredSignal1(window*i+j);
            end
        end
        for j=1:window
            filteredSignal1(window*i+j)=tempMax;
        end
    end
    
    for i=1:length(filteredSignal1)
        if(filteredSignal1(i)>7*10^-4)
            filteredSignal1(i)=1;
        else
            filteredSignal1(i)=0;
        end
    end
    
    %%%%%%%%%%%% convert sinusoidal to rect pulse for signal2 %%%%%%%%%%%%%
    filteredSignal2=abs(filteredSignal2);
    window=40;
    for i=0:length(filteredSignal2)/window-1
        tempMax=0;
        for j=1:window
            if filteredSignal2(window*i+j)>tempMax
                tempMax=filteredSignal2(window*i+j);
            end
        end
        for j=1:window
            filteredSignal2(window*i+j)=tempMax;
        end
    end
    
    for i=1:length(filteredSignal2)
        if(filteredSignal2(i)>7*10^-4)
            filteredSignal2(i)=1;
        else
            filteredSignal2(i)=0;
        end
    end
    %%%%%%%%%%%% convert sinusoidal to rect pulse for signal3 %%%%%%%%%%%%%
    filteredSignal3=abs(filteredSignal3);
    window=40;
    for i=0:length(filteredSignal3)/window-1
        tempMax=0;
        for j=1:window
            if filteredSignal3(window*i+j)>tempMax
                tempMax=filteredSignal3(window*i+j);
            end
        end
        for j=1:window
            filteredSignal3(window*i+j)=tempMax;
        end
    end
    
    for i=1:length(filteredSignal3)
        if(filteredSignal3(i)>7*10^-4)
            filteredSignal3(i)=1;
        else
            filteredSignal3(i)=0;
        end
    end

    j=1;
    for i=2:length(InputVoiceVector)
        if(filteredSignal1(i)>filteredSignal1(i-1))
            dataExtract(j)=0;
            j=j+1;
        end
        if(filteredSignal2(i)>filteredSignal2(i-1))
            dataExtract(j)=1;
            j=j+1;
        end
    end
  
end