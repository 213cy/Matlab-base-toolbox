% �㷨ϵ�У�8ƪ�������ڰ�ƪ ����˼�����ƪ ̰��˼�����ƪ ��̬�滮(matlab)
��������

�������http://www.mathworks.cn/matlabcentral/contest/contests/3/rules

sum(songList(indexList)) <= mediaLength, and 
gap = (mediaLength - sum(songList(indexList))) / mediaLengthis minimized. 
function indexList = binpack(songList,mediaLength) 
if (nargin == 0) 
    songList=songlis(1); 
    mediaLength=45; 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
[s,t] = sort(songList); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%�Ը��ʵ�˼�����һ�����Ž�� 
a = size(s,2); 
b = min(a,round(4*a*mediaLength/sum(s))); 
c = 85+0.09*a; 
%[d,e] = sort(rand(b,c)); 
[d,e] = sort(rand(b,c/4)); 
c=4*size(e,2); 
e = [e flipud(e) e([2:b 1],:) e([3:b 1 2],:)]; 
q = 0.25*(a-b); 
if q > 1
    r = floor(q*rand(1,c)); 
    e = e+r(ones(1,b),:); 
end
f = cumsum(s(e)); 
g = sum(f<=mediaLength); 
[d,h] = max(f(g+(0:b:b*c-b))); 
indexList = t(e(1:g(h),h)); 
%%�Ը��ʵ�˼�����һ�����Ž�� 
%%%%%%%%%%%%% 
%%����̰��˼�룬ȷ�����ս��Ԫ�ظ������������Ž���ͬ�� 
                        
%%%%%%%%%%%%% 
%%ͨ����̬�滮�������Ż����Ž⣬�Եõ����ս�� 
leftOff = t(e(g(h)+1:end,h)); 
remTime = mediaLength-d; 
onez1 = ones(1,g(h)); 
onez2 = ones(b-g(h),1); 
newFree = remTime + songList(onez2,indexList) - songList(onez1,leftOff)'; 
newFree(newFree<0) = 9e9; 
[m,i] = min(newFree); 
[m,j] = min(m); 
if m<remTime 
    aux = indexList(j); 
    indexList(j) = leftOff(i(j)); 
    leftOff(i(j)) = aux; 
    newFree = m+songList(onez2,indexList)-songList(onez1,leftOff)'; 
    newFree(newFree<0) = 9e9; 
    [m1,i] = min(newFree); 
    [m1,j] = min(m1); 
    if m1<m 
        aux = indexList(j); 
        indexList(j) = leftOff(i(j)); 
        leftOff(i(j)) = aux; 
        newFree = m1+songList(onez2,indexList)-songList(onez1,leftOff)'; 
        newFree(newFree<0) = 9e9; 
        [m2,i] = min(newFree); 
        [m2,j] = min(m2); 
        if m2<m1 
            indexList(j) = leftOff(i(j)); 
        end
    end
end
                        
%%ͨ����̬�滮�������Ż����Ž⣬�Եõ����ս�� 
%%%%%%%%%%%%%