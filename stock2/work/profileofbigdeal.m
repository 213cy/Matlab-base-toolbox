function profileofbigdeal(matf)
%
if ~nargin
    filename=['bigdeal\',datestr(date,'yymmdd')];
    matf=[filename,'.mat'];
end



% tic
% load(matf)
% totdeal=size(s,1)
% toc

% tic
matObj = matfile(matf);
totdeal=size(matObj,'s',1);
% toc 


pag=ceil(totdeal/50);
lapag=rem(totdeal,50);
disp('����Ŀǰ')
disp(['���չ��г���ǧ��󵥹�',num2str(totdeal),'��'])
disp(['��',num2str(pag),'ҳ,','���һҳ����',num2str(lapag),'��'])
disp('��󣨻����ǵ�һ����Ϊ:')
disp(matObj.s(totdeal,:))
%disp([s{end,:}])


