%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��ʵսMATLAB֮�ļ������ݽӿڼ��������ӳ���
% ��  �ߣ������� ��ά
% �����磺�������պ����ѧ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ���� 2-5 testnarin_out.m
% ����Ϊtestnarin_out.m�ļ�
function [varargout]=testnargin_out(varargin)
% function [varargout]=testnargin_out(m,n,k)
% testnarin_out.m
disp('��������ĸ���');
disp(nargin);
disp('��������ĸ���');
disp(nargout);
if(nargout>nargin)
    error('��������ĸ������ܴ�����������ĸ���!\n');
end
varargout{1:nargout} = varargin{1:nargout};
