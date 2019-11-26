% 特征点匹配
% 三角形边长匹配
% 找到一个特征点后，可以找出距离其最近的两个端点，与原特征点构成三角形，瑞两幅图像的三角形边长比例相等，则说明匹配
% find_point()找到最近的端点
function pxy=find_point(x0,y0,txy,num)
x=txy(:,1);
y=txy(:,2);
n=length(x);
k(1,n)=0;
lnn=0;
pxy(num,:)=[0,0,0];
for i=1:n
    k(i)=sqrt((x(i)-x0)^2+(y(i)-y0)^2);
end
kk=sort(k);
for i=1:num
    xiao=kk(i+lnn);
    nn=find(k==xiao);
    lnn=length(nn);
    pxy(i,:)=[x(nn(1)),y(nn(1)),txy(nn(1),3)];
end
plot(x0,y0,'bo');
x0;
y0;
hold on;
plot(pxy(:,1),pxy(:,2),'ro');

% ff=(sum(abs((dd1./dd2)-1))) ff越接近0 匹配度越高

