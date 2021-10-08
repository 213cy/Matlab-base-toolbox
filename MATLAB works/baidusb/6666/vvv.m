% importdata.m
%------------------------------------------------------
%���ݵ�������Ԥ����
%
%-------------------------------------------------------
%%%%%%%%%%%%%%%%
%���븽��������
%%%%%%%%%%%%%%%
%������ָ��
% [~, ~, raw] = xlsread('F:\A\����2-ָ���ܱ�.xls','�������','C3:EK29');
[~, ~, raw] = xlsread('����2-ָ���ܱ�.xls','�������','C3:EK29');


R = cellfun(@(x) ~isnumeric(x) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

redgrapetarget = cell2mat(raw);

    temp=redgrapetarget(:,sum(redgrapetarget)~=0);
    temp=zscore(temp);
    r=corrcoef(temp);  %�������ϵ������ 
    [x,y,z]=pcacov(r); 
    ind=cumsum(z)<70;
    
    mainredgrapetarget=temp*x(:,ind);


%������ָ��
% [~, ~, raw] = xlsread('F:\A\����2-ָ���ܱ�.xls','�������','C34:EK61');
[~, ~, raw] = xlsread('����2-ָ���ܱ�.xls','�������','C34:EK61');

R = cellfun(@(x) ~isnumeric(x) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

whitegrapetarget = cell2mat(raw);


    temp=whitegrapetarget(:,sum(whitegrapetarget)~=0);
    temp=zscore(temp);
    r=corrcoef(temp);  %�������ϵ������ 
    [x,y,z]=pcacov(r); 
    ind=find(cumsum(z)<70);
    
    mainwhitegrapetarget=temp*x(:,ind);

%�����Ѿ�ָ��
% [~, ~, raw] = xlsread('F:\A\����2-ָ���ܱ�.xls','���Ѿ�','C3:AH29');
[~, ~, raw] = xlsread('����2-ָ���ܱ�.xls','���Ѿ�','C3:AH29');


R = cellfun(@(x) ~isnumeric(x) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

redwinetarget = cell2mat(raw);


    temp=redwinetarget(:,sum(redwinetarget)~=0);
    temp=zscore(temp);
    r=corrcoef(temp);  %�������ϵ������ 
    [x,y,z]=pcacov(r); 
    ind=cumsum(z)<85;
    
    mainredwinetarget=temp*x(:,ind);

%�����Ѿ�ָ��
% [~, ~, raw] = xlsread('F:\A\����2-ָ���ܱ�.xls','���Ѿ�','C33:AH60');
[~, ~, raw] = xlsread('����2-ָ���ܱ�.xls','���Ѿ�','C33:AH60');


R = cellfun(@(x) ~isnumeric(x) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

whitewinetarget = cell2mat(raw);

    temp=whitewinetarget(:,sum(whitewinetarget)~=0);
    temp=zscore(temp);
    r=corrcoef(temp);  %�������ϵ������ 
    [x,y,z]=pcacov(r); 
    ind=cumsum(z)<85;
    
    mainwhitewinetarget=temp*x(:,ind);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%
%���븽��������
%%%%%%%%%%%%%%%
%�����ѷ�������
% [~, ~, raw] = xlsread('F:\A\����3-��������.xls','������');
[~, ~, raw] = xlsread('����3-��������.xls','������');
redgrapefrag=zeros(55,27);
for n=5:26+5
    temp=raw(1,n);
    temp=str2num(temp{1}(5:end));
    redgrapefrag(:,temp)=cell2mat(raw(2:56,n));

end
    redgrapefrag(isnan(redgrapefrag))=0;
    
    temp=redgrapefrag';
    temp=zscore(temp);
    r=corrcoef(temp);  %�������ϵ������ 
    [x,y,z]=pcacov(r); 
    ind=find(cumsum(z)<70);
    
    mainredgrapefrag=temp*x(:,ind);
    
    

%�����ѷ�������
% [~, ~, raw] = xlsread('F:\A\����3-��������.xls','������');
[~, ~, raw] = xlsread('����3-��������.xls','������');

whitegrapefrag=zeros(55,28);
for n=5:27+5
    temp=raw(1,n);
    temp=str2num(temp{1}(5:end));
    whitegrapefrag(:,temp)=cell2mat(raw(2:56,n));

end
whitegrapefrag(isnan(whitegrapefrag))=0;

    temp=whitegrapefrag';
    temp=zscore(temp);
    r=corrcoef(temp);  %�������ϵ������ 
    [x,y,z]=pcacov(r); 
    ind=find(cumsum(z)<70);
    
    mainwhitegrapefrag=temp*x(:,ind);
%�����ѾƷ�������
% [~, ~, raw] = xlsread('F:\A\����3-��������.xls','�����Ѿ�');
[~, ~, raw] = xlsread('����3-��������.xls','�����Ѿ�');

redwinefrag=zeros(73,27);
for n=5:26+5
    temp=raw(1,n);
    temp=str2num(temp{1}(5:end));
    redwinefrag(:,temp)=cell2mat(raw(2:74,n));

end
    redwinefrag(isnan(redwinefrag))=0;
    
        
    
    temp=redwinefrag';
    temp=zscore(temp);
    r=corrcoef(temp);  %�������ϵ������ 
    [x,y,z]=pcacov(r); 
    ind=find(cumsum(z)<70);
    
    mainredwinefrag=temp*x(:,ind);

%�����ѾƷ�������
% [~, ~, raw] = xlsread('F:\A\����3-��������.xls','�����Ѿ�');
[~, ~, raw] = xlsread('����3-��������.xls','�����Ѿ�');

whitewinefrag=zeros(73,28);
for n=5:26+5
    temp=raw(1,n);
    temp=str2num(temp{1}(5:end));
    whitewinefrag(:,temp)=cell2mat(raw(2:74,n));

end
    whitewinefrag(isnan(whitewinefrag))=0;
    
   

    temp=whitewinefrag';
    temp=zscore(temp);
    r=corrcoef(temp);  %�������ϵ������ 
    [x,y,z]=pcacov(r); 
    ind=find(cumsum(z)<70);
    
    mainwhitewinefrag=temp*x(:,ind);