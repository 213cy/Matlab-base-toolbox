% xiaoystistics
for n=1:2

fullURL = ['http://i.youku.com/u/UMTE0NDEzOTky/videos/order_1_view_1_page_',num2str(n)];

exPage = urlread(fullURL); 

small=regexp(exPage,'<div class="collgrid4w">.*?</div><!-- .collgrid4w -->','match');



small=cell2mat(small);



% temp=regexp(small,'(?<=<span.*?>).{1,10}(?=</span>)','match')



ytitle=regexp(small,'(?<=<a _hz="l_v_img" title=").+?(?=" target="_blank")','match');



ysrc=regexp(small,'(?<=" target="_blank" href=").+?(?="></a></li>)','match');



vtime=regexp(small,'(?<=<li class="v_time"><span class="num">).+?(?=</span>)','match');



vpub=regexp(small,'(?<=<li class="v_pub"><label>����ʱ��:</label><span>).+?(?=</span>)','match');



vplay=regexp(small,'(?<=<span title="����" class="ico__statplay"></span><span class="num">).+?(?=</span>)','match');



vcom=regexp(small,'(?<=title="����"></span><span class="num">).+?(?=</span>)','match');



ydata=[ytitle;ysrc;vtime;vpub;vplay;vcom]';

xlswrite('xiaoy.xls', ydata, 'xiaoy', ['A',num2str(20*n-19)])

end

yxls={'��Ŀ','����','ʱ��','����ʱ��','���Ŵ���','���۴���'}

xlswrite('xiaoy.xls',yxls,'xiaoy','A1')