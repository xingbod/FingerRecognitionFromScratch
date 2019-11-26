% 特征点匹配
% 点类型匹配
% tic; toc计时
% 找到一个特征点以后，在其周围找到四十个端点或交叉点，统计四十个点的交叉点和端点的个数
% 若两幅图断点占的比例近似相同则匹配
% fff=abs(f11-f21)/(f11+f12) 越接近于0 匹配度越高
close all;
tic;
clear;
thin1=tuxiangyuchuli('zhiwen.png');
thin2=tuxiangyuchuli('zhiwen.png');
figure;
txy1=point(thin1);
txy2=point(thin2);
[w1,txy1]=guanghua(thin2,txy2);
[w2,txy2]=guanghua(thin2,txy2);
thin1=w1;
thin2=w2;
txy1=cut(thin1,txy1);
txy2=cut(thin2,txy2);
[pxy31,error2]=combine(thin1,8,txy1,60);
[pxy32,error2]=combine(thin2,8,txy2,60);
error=1;
num=20;
cxy1=pxy31;
cxy2=pxy32;
d1=distance(cxy1(1,1),cxy1(1,2),num,thin1);
d2=distance(cxy2(1,1),cxy2(1,2),num,thin2);
f=(sum(abs((d1./d2)-1)));
if(f<0.5)
    error=0;
else
    error=1;
end
f
c11=find_point(cxy1(1,1),cxy1(1,2),txy1,1);
c12=find_point(cxy1(1,1),cxy1(1,2),txy1,2);
c21=find_point(cxy2(1,1),cxy2(1,2),txy2,1);
c22=find_point(cxy2(1,1),cxy2(1,2),txy2,2);
cxy1(2,:)=c11;
cxy1(3,:)=c12(2,:);
cxy2(2,:)=c21;
cxy2(3,:)=c22(2,:);
x11=cxy1(1,1);y11=cxy1(1,2);
x12=cxy1(2,1);y12=cxy1(2,2);
x13=cxy1(3,1);y13=cxy1(3,2);
x21=cxy2(1,1);y21=cxy2(1,2);
x22=cxy2(2,1);y22=cxy2(2,2);
x23=cxy2(3,1);y23=cxy2(3,2);
dd1(1)=juli(x11,y11,x12,y12);
dd1(2)=juli(x12,y12,x13,y13);
dd1(3)=juli(x13,y13,x11,y11);
dd2(1)=juli(x22,y21,x22,y22);
dd2(2)=juli(x22,y22,x23,y23);
dd2(3)=juli(x23,y23,x21,y21);
ff=sum(sum(abs((d1./d2)-1)))
if ff<1
    error=0
else error=1
end
cxy1(2:41,:)=find_point(pxy31(1,1),pxy31(1,2),txy1,40);
cxy2(2:41,:)=find_point(pxy32(1,1),pxy32(1,2),txy2,40);
f11=length(find(cxy1(:,3)==2));
f12=length(find(cxy1(:,3)==6));
f21=length(find(cxy2(:,3)==2));
f22=length(find(cxy2(:,3)==6));
fff=abs(f11-f21)/(f11+f12)
toc


