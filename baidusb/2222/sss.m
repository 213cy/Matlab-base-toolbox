% matlab����ʱ��
%%%%%%%%%%%%%%%%

%   һ����ʾmatlab��ʼ����ʱ����������ļ�

::ð���ǽ�����ǩ(���Ժ����?),˫ð���ǽ���һ���޷������õı�ǩ,

: ð�żӿո��ǽ���һ��û���ı�ǩ,�������Ƕ�������дע��

echo off & cls

::��һ����echo�����cls����д��һ��ȥ��

echo %time%

::��ʾϵͳ�Դ��Ķ�̬����time,

::����ϵͳ�Դ��Ķ�̬�������Բ쿴cmd��set�İ����ĵ�,���� set /?

::cd /d F:\mywork
matlab -nosplash -sd F:/mywork

::����matlab,�������������Ҫ����matlab��ݷ�ʽͬһĿ¼��

echo ��������˳�
pause >nul
: & exit
: %0

%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%

�� matlabrcͷ�� ����

tic

�� matlabrcβ�� ���� startup ������

toc

datestr(now, 'hh:MM:SS FFF')

 %%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%

����matlab��shortcut��

datestr(now, 'hh:MM:SS FFF')

matlab����֮��Ѹ�ٵ�����% -_-!