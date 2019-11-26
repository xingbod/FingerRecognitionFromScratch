%找出独特的端点作为特征点  一个端点的周围半径为r个像素的圆内没有任何端点或交叉点
%随着r的逐渐变大，这样的点会变少，也就会越来越独特
function [pxy2,error]=single_point(txy,r)
error=0;
x=txy(:,1);
y=txy(:,2);
n=length(x);
d(1:n,1:n)=0;
for j=1:n
    for i=1:n
        if(i~=j)
            %计算两点间距离
            d(i,j)=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
        else
            d(i,j)=2*r;
        end
    end
end
[a,b]=min(d);
c=find(a>r);
pxy2=txy(c,:);
pxy2=pxy2(find(pxy2(:,3)==2),:);
t=size(pxy2,1);
if t==0
    error=1;
else
    plot(x,y,'b.');
    hold on
    plot(pxy2(:,1),pxy2(:,2),'r.');
end
    

            
    
