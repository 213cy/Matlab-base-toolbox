% ������ʽ ƥ��Ϸ�email��ַ
%% ���Լ�,��ӭ��Ҳ���
emailStrAll={'ilovematlab123@gmail.com', ...%�Ϸ�
    'ilovematlab123@gmail.com.cn',...%�Ϸ�
    'ilove.matlab@gmail.com.cn',...%�Ϸ�
    'ilove_matlab@gmail.com',... %�Ϸ�
    'ilove_matlab@gmail-123.com',... %�Ϸ�
    'ilovematlab.@gmail.com', ...%����ȫ���ǲ��Ϸ�����ӭ��Ҳ���
    '_ilovematlab@gmail_com', ...
    'ilovematlab@@gmail.com', ...
    'ilovem@matlab@gmail.com', ...
    'ilovema&tlab@gmail.com.cn', ...
    'ilovematlab@gmail', ...
    'ilovematlab@gmail.', ...
    'ilovematlab@.gmail', ...
    'ilovematlab@i-com'};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ������
string=emailStrAll;
%string='ilovemat_la.b123@Gmai-l.com';
%(1)@ǰ----a����\w��\.��ɣ�b��β������ĸ���ֹ��ɣ�c�ڲ�û��������_\.
%(2)@----���ҽ���һ��@����
%(3)@��@��ĵ�һ��\.----a����[a-zA-Z0-9\-]��ɣ�b��β������ĸ���ֹ��ɣ�c�ڲ�û��������-
%(4)@��ĵ�һ��\.----���ҽ���һ��
%(5)@��ĵ�һ��\.�Ժ�----a����[a-zA-Z0-9\-.]��ɣ�b��β������ĸ���ֹ��ɣ�c�ڲ�û��������-\.
expressn=['^[a-z0-9]+(?:[_.][a-z0-9]+)*@'...   %����(1)(2)
    '[a-z0-9]+(?:\-[a-z0-9]+)*\.'...           %����(3)(4)
    '[a-z0-9]+(?:[\-.][a-z0-9]+)*$'];          %����(5)
%���������ļ��裬������Ҫ��������һ����
%����������-_\.ʱ����Ϊ���Ϸ�
isvaild=regexpi(string,expressn);
%%
reslstr={'�Ϸ�','���Ϸ�'};
disp([emailStrAll',cellfun(@(x) reslstr(isempty(x)+1),isvaild)'])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% һЩ������Ϊ�ָ�
string='ilov.em$at.@.la._b123G.mai-l.com';
regexp(string, '[@.]','split')
D=textscan(string,'%s','Delimiter','@.');
D{1}'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ����һ
string='ilov.em$at.@.la._b123G.mai-l.com';
string=emailStrAll{14};
C=textscan(string,'%s','Delimiter','@');
if size(C{1},1)==2
    b=cellfun(@(x)textscan([x,'.'],'%s','Delimiter','.'),C{1});
    %PS=cell2struct(C{1},{'prefix','suffix'},1);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %@ǰ�Ƿ��зǷ��ַ�
    flag(1)=any(regexp([b{1}{:}],'[^\w]'));
    %@���Ƿ��зǷ��ַ�
    flag(2)=any(regexp([b{2}{:}],'[^a-zA-Z\-0-9]'));
    %%%
    % %     %�ж��Ƿ����������'.'   ���ǳ����ڿ�ͷ�ͽ�β��'.'
    % %     flag(4)=any(cellfun(@isempty,cat(1,b{:})));
    %%%
    % �ж��Ƿ����������'.'   ���ǳ����ڿ�ͷ�ͽ�β�ķǷ��ַ�
    try
        flag(3)=any(cellfun(@(x) any(regexp(x([1,end]),'[^a-zA-Z0-9]')),cat(1,b{:})));
    catch err
        flag(3)=1;
    end
    % �ж�@���Ƿ���.
    flag(4)=size(b{2},1)<=1;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if all(~flag)
        disp('vaild email address')
    else
        disp('invaild')
        disp(['flag:',mat2str(flag)])
    end
else
    disp('the number of ''@'' signs is not equal to one')
end