% �㷨ϴ��ϵ�У�8ƪ����������ƪ ö��˼��(matlab) 02.png
��д���ֵ�ģ�壬����ÿ���ֶ����������еġ�0~9������ôҪ����������������ܹ������ģ�塣




        

clear  
k=0;  
lop=1;  
t=0;  
while lop&&t<10
    t=t+1;  
    for s=1:9
        k=k+1;  
        if mod(t*111111,s)==0
            tmp=num2str(t*111111/s)-'0';  
            if tmp(1)==s&tmp(end)==t  
                if length(unique(tmp))==5
                 k,tmp  
                 lop =0;  
                 break
                end  
            end  
        end  
    end  
        
end