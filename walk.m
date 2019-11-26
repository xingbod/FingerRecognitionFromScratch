%判断离端点num距离内是否有另一端点
function [error,a,b]=walk(thin,x0,y0,num)
error=0;
thin(x0,y0)=0;
t1=0;
for n=1:num
    if error==1
        break
    else
        x=x0;
        y=y0;
        %判断该点八邻域点和该点的和 来找出想要的点
        for x=x0-1:x0+1
            if error==1
                break;
            else
                for y=y0-1:y0+1
                    t1=(sum(sum(thin(y0-1:y0+1,x0-1:x0+1))));
                    %=0代表一个断点（独立的点） dayu2代表不是端点
               
                    if(t1==0||t1>2)
                        error=1;
                        a=x0;
                        b=y0;
                        break;
                    else
                        % x,y还是y，x
                        if (thin(y,x)==1&&(x-x0)^2+(y-y0)^2~=0)
                            if(t1>2)
                                error=1;
                                break;
                            else thin(y,x)=0;
                                x0=x;
                                y0=y;
                                a=x0;
                                b=y0;
                                plot(x0,y0,'r.');
                            end
                        end
                    end
                end
            end
        end
    end
end

              
                        
        
