% ������ڵ�γ�Ƚǣ�
n=deg2rad( 39.52);
% ������ڵľ��Ƚǣ�
e=deg2rad( 79.75  );
% ̫��ֱ���γ��(����)��
N_datenum=datenum([2015,7,20]);
% ̫��ֱ�����Ծ��Ƚ�������
time=(12+41/60:3/60:13+41/60)-8;%��������ʱ�� G.M.T.
Et_absolute=2*pi*(12-time')/24;%̫��ֱ���ľ���ת����

%%
shadow_vec4=polesun2shadow_4(n,e,N_datenum,Et_absolute,time);
% subplot(211)
% hold on
% plot(3*sqrt(sum(shadow_vec4.*shadow_vec4,2)),'sr')
% subplot(212)
hold on
plot(shadow_vec4(:,1),shadow_vec4(:,2),'sr')
