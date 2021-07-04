% dipshudo

function dipsd(A,B)
%display shudo
%
if nargin <1
    A=dlmread('shuju.txt');
end
if nargin <2
    plotframe
end
if nargin ==2
    A=A.*B;
end
if iscell(A)
    A=mrk2mat(A);
end

dipnum(A)
%%%%%%%%%%%%%%%%
    function plotframe
        a=repmat([0 ;3],1,4);
        b=repmat(0:3,2,1);
       
        figure('Toolbar','none');
        plot([b,a],[a,b],'k','LineWidth',2)
        axis equal
        axis off
        hold on
        for m=0.02:1:3
            for n=0.02:1:3
                plot(0.32*[b,a]+m,0.32*[a,b]+n,'k','LineWidth',2)
            end
        end
    end
%--------------------------------------------------
    function dipnum(A)
        [c,d]=find(A);
       
       
        y= 2-floor((c-1)/3)+1-0.32*mod(c-1,3)-0.18;
        x= floor((d-1)/3)+0.32*mod(d-1,3)+0.12 ;
        for k=1:length(c)
           
            text(x(k),y(k),num2str(A(c(k),d(k))),'FontSize',22)
        end
    end
 %%%%%%%%%%%%%%%%%%%
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

doc drawSudoku

doc sudokuEngine

���Ǻ���֮ǰ��д��һ�������������һ����

%%%%%%%%%%%%%%%%%%%%
�Ǹ�������������Ȼ�Ƚϸ��ӣ��������ҵ�ˮƽ��ϣ������Ǻܸ�Ч��
���Կ����ã�����κ�������û�����⡣
�������⡣


���ڷ���matlab2014a�Ż��������Դ���ר�ŵ�����������
���һ��и�ר������������������
doc('Solve Sudoku Puzzles Via Integer Programming')��
��������Cleve Moler д��ʹ�õݹ鷽����������ĳ������ҳ����
http://www.mathworks.cn/company/newsletters/articles/solving-sudoku-with-matlab.html

���Ƿ�����������Լ�д�ĳ����Ҿ������������Ӽ������ɾ�����ڴ�֮ǰ�Ȱ����������ϣ�

http://www.ilovematlab.cn/thread-294985-1-1.html

����Ժ����ж�������Ȥ�������������ٿ����������Ҿ�����ûʲô�����ˡ�

��Щ�ļ��������һ���� start.m �ĺ�������������ܼ򵥴򿪺󿴿���֪����ôʹ����