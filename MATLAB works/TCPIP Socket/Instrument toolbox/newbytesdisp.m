function newbytesdisp(netObj,event)
%%%
disp(['  --- trigger new BytesAvailable callback ---  �ۼƽ�������',...
    num2str(netObj.ValuesSent),'bytes']);
% disp(strcat('�ۼƽ�������',num2str(netObj.ValuesSent),'bytes'));
%�鿴���յ�����
nBytes = get(netObj,'BytesAvailable');
if nBytes>0
%     data = fread(netObj,nBytes/2,'int16');
    data = fread(netObj,nBytes,'uint8')';
    disp('�½��յ�������Ϊ:');
    txt = char(data);
    disp(txt);
%     disp(arrayfun(@string,txt));
    disp(string(txt')')
    disp(string(dec2hex(data))')
else
    disp('�����Ѿ���ȫ����ȡ,û�и�������');
end
 