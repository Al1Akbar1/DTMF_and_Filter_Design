function [outVoice] = Encrypt(str)
    fs=44100;
    decArray=double(str);
    binArray=dec2bin(decArray);
    dataSignal=(Func1(binArray))';

    inputMusic=audioread('inputMusic.wav');
    temp=inputMusic(1:length(dataSignal));


    testVector=dataSignal/1000+temp;
    outVoice=testVector;
    audiowrite("EncAudio.wav",testVector,fs);
end