% ��̳ͳ��(һ)
function  forum=forumstatistic(taskind)
% �ƶ˲��Ϻ��֣���汾������pc�����У�

% ���ƶ����еò�����ȷ���

if nargin<1||all(taskind==0)
    %%
    url_main='http://www.ilovematlab.cn/';%forum.php
    %
    str=urlread(url_main);%[,'forum.php']
    expression='(?<=��ӭ�»�Ա: <em><a href=")(.*?)" target="_blank" class="xi2">(.*?)(?=</a></em></p>)';
    SPACE=regexp(str,expression,'tokens','once');
    %
    %url_id='http://www.ilovematlab.cn/space-username-%s.html';sprintf(url_id,SPACE{1})
    str=urlread([url_main,SPACE{1}]);
    expression='(?<=href="http://www.ilovematlab.cn/\?).*?(?=")';
    ID=regexp(str,expression,'match','once');
    N=str2double(ID);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%
    if exist('taskind','var')
        forum.lastmember=SPACE{2};
        forum.totalmember=N;
        return
    end
    if ~isunix
        button=questdlg(['��Ҫ����ȫ�� ',ID,' ���û�����Ϣô?'], 'Confirm');
        if ~isequal(button,'Yes')
            forum=[];
            return;
        end
    end
    taskind=1:N;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
forum = cell(500,4);
sind=1;
for k=taskind;%N
    UID=num2str(k);
   
    % % url_space='http://www.ilovematlab.cn/?';
    % % str=urlread([url_space,PIP]);%27009 char
    url_profile='http://www.ilovematlab.cn/home.php?mod=space&uid=%s&do=profile';
    str=urlread(sprintf(url_profile,UID));%13767 char
   
    expression='(?<=<li><em>����</em>).*?(?=</li>)';
    score=regexp(str,expression,'match','once');
   
    if str2double(score)>49
        expression='(?<=<h2 class="mbn">\r\n).*?(?=<span class="xw0">)';
        name=regexp(str,expression,'match','once');
       
        expression='(?<=<em>ע��ʱ��</em>).*?(?= )';
        date=regexp(str,expression,'match','once');
       
        forum{sind,1}=name;
        forum{sind,2}=score;
        forum{sind,3}=UID;
        forum{sind,4}=date;
       
        sind=sind+1;
    end
end
%%
R=sind-1;
forum =forum(1:R,:);
[~,ind]=sort(str2double(forum(:,2)),'descend');%str2double
forum=forum(ind,:);
save('forumdata.mat','forum')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-------------------------------------------



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  forum=forumstatistic(taskind)
% ����ת���ַ���б�� \N \xN
%ʹ�øó������ƶ�Ҳ����ȷ����
if nargin<1||all(taskind==0)
    %%
    url_main='http://www.ilovematlab.cn/';%forum.php
    %
    str=urlread(url_main);%[,'forum.php']
    %
    expression='(?<=<em><a href=")(.*?)" target="_blank" class="xi2">(.*?)(?=</a></em></p>)';
    SPACE=regexp(str,expression,'tokens','once');%��ӭ�»�Ա:
    %
    %url_id='http://www.ilovematlab.cn/space-username-%s.html';sprintf(url_id,SPACE{1})
    str=urlread([url_main,SPACE{1}]);
    expression='(?<=href="http://www.ilovematlab.cn/\?).*?(?=")';
    ID=regexp(str,expression,'match','once');
    N=str2double(ID);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%
    if exist('taskind','var')
        forum.lastmember=SPACE{2};
        forum.totalmember=N;
        return
    end
    if ~isunix
        button=questdlg(['��Ҫ����ȫ�� ',ID,' ���û�����Ϣô?'], 'Confirm');
        if ~isequal(button,'Yes')
            forum=[];
            return;
        end
    end
    taskind=1:N;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
forum = cell(500,4);
sind=1;
for k=taskind;%N
    UID=num2str(k);
   
    % % url_space='http://www.ilovematlab.cn/?';
    % % str=urlread([url_space,PIP]);%27009 char
    url_profile='http://www.ilovematlab.cn/home.php?mod=space&uid=%s&do=profile';
    str=urlread(sprintf(url_profile,UID));%13767 char
   
    %dec2hex(double('����'))=[79EF 5206]
    expression='(?<=<li><em>\x79EF\x5206</em>).*?(?=</li>)';
    score=regexp(str,expression,'match','once');
   
    if str2double(score)>49
        expression='(?<=<h2 class="mbn">\r\n).*?(?=<span class="xw0">)';
        name=regexp(str,expression,'match','once');
       
        %dec2hex(double('ע��ʱ��'))=[6CE8 518C 65F6 95F4]
        expression='(?<=<em>\x6CE8\x518C\x65F6\x95F4</em>).*?(?= )';
        date=regexp(str,expression,'match','once');
       
        forum{sind,1}=name;
        forum{sind,2}=score;
        forum{sind,3}=UID;
        forum{sind,4}=date;
       
        sind=sind+1;
    end
end
%%
R=sind-1;
forum =forum(1:R,:);
[~,ind]=sort(str2double(forum(:,2)),'descend');%str2double
forum=forum(ind,:);
try
    f=load('forumdata.mat');
    forum=[f.forum;forum];
    save('forumdata.mat','forum')
catch
    save('forumdata.mat','forum')
end