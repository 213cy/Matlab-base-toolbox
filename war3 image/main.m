setenv('MW_MINGW64_LOC','D:\mingw64')
%%
mex -v fetchimage.c
%%
system("C:\Users\Administrator\Documents\vscode\Capturing war3\capture.exe &")
%%
if not(libisloaded('fetchimage'))
    [notfound,warnings]=loadlibrary('fetchimage')
end
% libfunctions('fetchimage')
% libfunctions('fetchimage','-full')
% libfunctionsview fetchimage
%% ��ʼ��֮ǰ ���ȴ�war3 �� capture����,������capture ����war3 ����
calllib('fetchimage','initFetchImage',0,0)
%%
pause(25)
sound([1 -1 -1 -1 1])
A=fetchimage(5);
% imshow(A)
calllib('fetchimage','commandMove',1, 1, 500)
pause(2)
calllib('fetchimage','commandClick',134, 682)
pause(2)
calllib('fetchimage','commandClick',341, 889)
pause(2)
calllib('fetchimage','commandClick',135, 683)
pause(2)
calllib('fetchimage','commandClick',340, 888)
pause(2)
calllib('fetchimage','commandClick',133, 681)
pause(2)
calllib('fetchimage','commandClick',342, 890)
pause(2)
sound([1 -1 1 -1 1])
%%
calllib('fetchimage','endFetchImage')
unloadlibrary fetchimage