% 综合walk和single_point函数，通过执行[pxy3,error2]=combine(thin,r,txy,num)可以找出周围半径为r个像素的院内没有任何交叉点或端点，并且沿纹线走num个
% 距离内没有任何哟个交叉点或端点
function [pxy3,error2]=combine(thin,r,txy,num)
error=0;
[pxy2,error]=single_point(txy,r);
n=size(pxy2,1);
k=1;
erroe2=0;
for i=1:n
    [error,a,b]=walk(thin,pxy2(i,1),pxy2(i,2),num);
    if error~=1
        pxy3(k,1)=pxy2(i,1);
        pxy3(k,2)=pxy2(i,2);
        pxy3(k,3)=pxy2(i,3);
        k=k+1;
        error2=0;
        plot(pxy2(i,1),pxy2(i,2),'r+');
    end
end