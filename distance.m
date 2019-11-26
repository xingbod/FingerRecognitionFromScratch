% 特征点匹配
% 纹线长度匹配 对于找到的特征点和纹线 沿着纹线走5个像素到原始端点的距离
function d=distance(x0,y0,num,thin)
num2=fix(num/5);
for i=1:num2
    [error,a,b]=walk(thin,x0,y0,5*i);
    if error~=1
        d(i)=sqrt((a-x0)^2+(b-y0)^2);
    else
        break;
    end
end

% 最后会得到一个装有长度信息的数组，如果两幅指纹途中的指纹是一样的，则他们含有相同的特征点和从这个特征点出发画出的纹线
% 则这两个数组对应位置的数据基本相等（图像大小相同，则他们的比例接近1）
% f=（sum(abs((d1./d2)-1))）f越接近0 匹配度越高