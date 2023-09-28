function [outputSignal] = Func1(dataVector)
    fs=44100;
    
    f1=5400;
    f2=5750;
    f3=6100;
    sampleIn50ms=fs*0.05;
    sampleIn100ms=fs*0.1;
    sampleIn150ms=fs*0.15;
    sampleIn200ms=fs*0.2;
    
    lenOfdata=length(dataVector);
    out=[round(lenOfdata/8)*(sampleIn100ms+sampleIn150ms)+lenOfdata*sampleIn150ms];
    Index=0;
    for i=1:length(dataVector)
        if(rem(i,8)==1)
            for j=Index+1:sampleIn200ms+Index
                out(j)=0;
            end
            Index=Index+sampleIn200ms;
            for j=Index+1:sampleIn50ms+Index
                out(j)=sin(2*pi*f3*rem(j,sampleIn50ms)/fs);
            end
            Index=Index+sampleIn50ms;
            for j=Index+1:sampleIn100ms+Index
                out(j)=0;
            end
            Index=Index+sampleIn100ms;
        else
            for j=Index+1:sampleIn100ms+Index
                out(j)=0;
            end
            Index=Index+sampleIn100ms;
        end

        if dataVector(i)==0
            for j=Index+1:sampleIn50ms+Index
                out(j)=sin(2*pi*f1*rem(j,sampleIn50ms)/fs);
            end
            Index=Index+sampleIn50ms;
        end
        if dataVector(i)==1
            for j=Index+1:sampleIn50ms+Index
                out(j)=sin(2*pi*f2*rem(j,sampleIn50ms)/fs);
            end
            Index=Index+sampleIn50ms;
        end
    end 
    for j=Index+1:sampleIn100ms+Index
        out(j)=0;
    end

    outputSignal=out;
end