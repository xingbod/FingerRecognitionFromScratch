function [w,pxy]=guanghua(thin,txy)
%纹线光滑处理.原理：找到每个端点，使其沿着纹线的方向移动5个像素，如果在5个像素之内遇到交叉点，则认为此端点为毛刺，，去除此点
for j=1:5
    txy=point(thin);
    %txy第三列为2的变为1 否则变为0
    pxy=txy(find(txy(:,3)==2),:);
    %求取行数
    n=size(pxy,1);
    for i=1:n
        error=0;
        error=walk(thin,pxy(i,1),pxy(i,2),5);
        if error==1;
            thin(pxy(i,2),pxy(i,1))==0;
        end
    end
end
w=thin;
imshow(w);