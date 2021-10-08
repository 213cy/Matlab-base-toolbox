function objval=objfun(n,e,N_datenum,Et_absolute,xy,time)
%
global calobjval calcoord

switch calcoord
    case 1 
        shadow_vec=polesun2shadow(n,e,N_datenum,Et_absolute);
    case 2 %���ǵ���뾶�͵��վ���
        shadow_vec=polesun2shadow_2(n,e,N_datenum,Et_absolute);
    case 4 %���ǵ���뾶�͵��վ��� ����Ϊһ��֮��̫��ֱ���γ�Ȼᷢ���仯
        shadow_vec=polesun2shadow_4(n,e,N_datenum,Et_absolute,time);
end
%
%% ��������ļ�ģ�� kΪ������
% leng=sqrt(sum(shadow_vec.*shadow_vec,2));
% sinalpha=k*leng./sqrt(leng.^2+1);
% shadow_vec=sinalpha./sqrt(1-sinalpha.^2);

switch calobjval
    case 1
        %% ���� ��ת ��ƽ��
        objval=findmat(shadow_vec,xy);
        
    case 2
        %% ���� ��ת ƽ��
        objval=findmat_2(shadow_vec,xy);
        
    case 3
        %% ���ַ��������˺ܶ�ƥ����Ϣ����Ȼ�򵥵������ܴ�
        obj_vec=sum(xy.*xy,2);
        match_vec=sum(shadow_vec.*shadow_vec,2);
        objval=subspace(obj_vec,match_vec);
        %objval=log(subspace(obj_vec,match_vec));
end
