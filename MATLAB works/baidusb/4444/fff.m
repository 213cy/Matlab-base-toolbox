% ���ͼ�ζ���findall findobj get(h,'type') 'handleVisibility'
findall(0)
findobj(gca)
allchild(gcf)
patch;surface;text;line;axes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
axes
hold on
axis equal

h=allchild(gcf);
get(h,'type')
toolbar=allchild(h(end))
get(toolbar,'type')
inspect(toolbar(6))


fh = @(x,y) sqrt(x.^2 + y.^2 - 1);
ezplot(fh)
plot(1:4)
rectangle('Position',[0,0,3,2],'Curvature',[1,1])
%�ڵ�ǰ��axes�ϣ������annotation
ah=allchild(gca);
get(ah,'type')% line rectangle hggroup
h2=findobj(gca,'type','line')
x=get(h2,'xdata')
y=get(h2,'ydata')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
axes
get(allchild(gca),'type')
findobj('type','text')%��Ȼ�ж��󣬵���handlevisibilityΪoff�����Ҳ���
tth=findall(gcf,'type','text')
get(tth,'handlevisibility')
set(tth,'handlevisibility','on')
findobj('type','text')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hg=annotation('rectangle',[0.25 0.25 0.5 0.5],...
 'FaceAlpha',.2,'FaceColor','g','EdgeColor','m');
%���½�һ�����ص�axes�������annotation
get(hg,'type')
findall(gcf,'type','hggroup')
set(hg,'handlevisibility','on')
findobj('type','hggroup')%���ȵ�visibility��off�������Ծ��Ҳ���
set(get(hg,'parent'),'handleVisibility','on')
findobj('type','hggroup')