function [c,ceq] = mycon(obj,Cy,By)
%% �Ż��÷�����Լ������
c=2 *sum(Cy<obj) - sum(By<obj);
ceq=[];
end