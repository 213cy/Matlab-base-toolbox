function shadow_vec=polesun2shadow_4(n,e,N_datenum,Et_absolute,time)
% ���ɵ�λ�˳���ˮƽ����ͶӰ����������
% ���ǵ���뾶���յؾ���,�Լ�̫��ֱ�����һ��֮�ڵı仯
%
%������ڵ�γ�Ƚǣ�n����γΪ������γΪ�� ȡֵ���䣺[-pi/2,pi/2]
%������ڵ㾭�Ƚǣ�e������Ϊ��������Ϊ�� ȡֵ���䣺[-pi,pi]
%̫��ֱ������ڵ�γ�Ƚǣ�N����γΪ������γΪ�� ȡֵ���䣺[-pi/2,pi/2]
%��ֵ���ڣ�N_datenum
%̫��ֱ������ڵ㾭�Ƚ�������Et_absolute������Ϊ��������Ϊ�� ȡֵ���䣺[-pi,pi]
%
%
Rs_mean =149600000000;
Re_mean=6371393;%�ϸ�˵���üӸ˳�
%% ̫��ֱ����γ�Ƚǵ�������
N_RET = deg2rad( dms2degrees( [23 26 21.448] ) ); %���ع���γ��
time_GMT=N_datenum + time'/24;
alpha=2*pi*(datenum([2015,6,21,16,37,0])-time_GMT)/365.2422;% ̫��ֱ����������ת��
% ͨ��������������������(�յ�����ϵ��)���ڻ�ȷ��̫��ֱ����γ�Ƚ�(������)
%N=pi/2-acos([sin(N_RET),0,cos(N_RET)]*[cos(alpha),sin(alpha),0]');%̫��ֱ����γ�Ƚ�
sin_N=sin(N_RET)*cos(alpha);%=sin(N)
cos_N=sqrt(1-sin_N.^2);%=cos(N)
%% ̫��ֱ��㾭����Ը˵㾭�ȵ�
% ��Ծ��Ƚǣ�
Et=Et_absolute-e;
%%
% ����������[cos(n) 0 sin(n)]
% ����������[cos(N)*cos(Et) cos(N)*sin(Et) sin(N)] (��������ϵ��)
% ����������[-sin(n) 0 cos(n)]
% ����������[0 1 0]
%% ��������
PoleTop_vect_unit=[cos(n) 0 sin(n)]';
%%
shadow_vec_3D=zeros(length(Et),3);
for k=1:length(Et)
    %% ��������
    Sun_vect_unit=[cos_N(k)*cos(Et(k)) cos_N(k)*sin(Et(k)) sin_N(k)]';
    %% �����������˵Ķ���λ��������ȥ̫��λ������
    % ��������(�ڲ����ǵ���뾶���յؾ���ʱ������������������)
    light_vec=Re_mean*PoleTop_vect_unit-Rs_mean*Sun_vect_unit;
    %light_vec_unit=orth(light_vec);
    %theta(k)=subspace(PoleTop_vect_unit,light_vec_unit);
    %shadow_vec_3D(k,:)=PoleTop_vect_unit+light_vec_unit'/cos(theta);
    %shadow_vec_3D(k,:)=PoleTop_vect_unit+light_vec_unit'/(PoleTop_vect_unit*light_vec_unit);
    shadow_vec_3D(k,:)=PoleTop_vect_unit-light_vec/(PoleTop_vect_unit'*light_vec);
    %% ��֤����
    if 0
        shadow_vec_3D(k,:)*PoleTop_vect_unit
        if shadow_vec_3D(k,:)*PoleTop_vect_unit>1e-5
            error('error')
        end
    end
    %%
end
%% ͶӰ��ƽ������
y_e=[-sin(n) 0 cos(n)]';%����λ����
x_e=[0 1 0]';%����λ����
A=[x_e,y_e];%����任����
%% Ӱ��������
% ˮƽ���ϵ�Ӱ�������� (������Ϊx�ᣬ������Ϊy��)
shadow_vec=shadow_vec_3D*A;


