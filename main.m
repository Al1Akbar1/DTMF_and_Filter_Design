fs=44100;
x=[0 1 1 1 0 1 0 0 0 1 0 1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Q1     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dataSignal=(Func1(x))';
plot(dataSignal)
%Reading Audio
inputMusic=audioread('inputMusic.wav');
temp=inputMusic(1:length(dataSignal));

testVector=dataSignal/1000+temp;
audiowrite("myAudio.wav",testVector,fs);

pause(3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Q2     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
temp=audioread('myAudio.wav');

resault=Func2(temp);
disp("The resault:");
disp(resault);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Q3       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
temp=audioread('question.wav');
Decrypt(temp);



