clear; clc;
figure(1);
xlim([0,1000]);
ylim([0,1000]);
x=ginput();
x_size=size(x);
for i=1:x_size(1)-1
    x1=x(i,1);
    y1=x(i,2);
    x2=x(i+1,1);
    y2=x(i+1,2);

    BresenhamDraw(x1,y1,x2,y2);



end
BresenhamDraw(x(1,1),x(1,2),x(x_size(1),1),x(x_size(1),2))

function BresenhamDraw(x1,y1,x2,y2)          
        
        if x1>x2
            t=x2;
            x2=x1;
            x1=t;
            f=y2;
            y2=y1;
            y1=f;
        end
        m=round(x1);
        n=round(y1);
        plot(m,n,'r.');hold on;
       if round(x2)==round(x1)
            for j=round(y1):round(y2)
                    plot(m,j,'r.');hold on;
            end
       else
        k=(y2-y1)/(x2-x1);
        for i=round(x1):round(x2)-1
            
                plot(m+1,round(y1+k),'r.');hold on;

           
            m=m+1;
            y1=y1+k;
        end 
 
        
       end
end
