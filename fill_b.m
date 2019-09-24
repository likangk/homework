clear all; clc;
figure(2);
xlim([0,100]);
ylim([0,100]);
x=ginput();
x_size=size(x);
min_y=x(1,2);
max_y=x(1,2);

%�ҳ����е��y�����ֵ����Сֵ
for i=1:x_size(1)
    if x(i,2)>max_y
        max_y=x(i,2);
    end
    if x(i,2)<min_y
        min_y=x(i,2);
    end
end
edge=zeros(x_size(1),4);
%��ά����edge����ߣ�xֵ��С�ĵ���ǰ
for i=1:x_size(1)-1
    if x(i,1)>x(i+1,1)
        edge(i,:)=[x(i+1,1),x(i+1,2),x(i,1),x(i,2)];
    else
        edge(i,:)=[x(i,1),x(i,2),x(i+1,1),x(i+1,2)];
    end
end
if x(x_size(1),1)>x(1,1)
    edge(x_size(1),:)=[x(1,1),x(1,2),x(x_size(1),1),x(x_size(1),2)];
else
    edge(x_size(1),:)=[x(x_size(1),1),x(x_size(1),2),x(1,1),x(1,2)];
end

for i=round(min_y):round(max_y)
index_p=zeros(1,20); 
count=0;
jd_x=zeros(1,20);
%����뵱ǰɨ�����ཻ���ߵ������ͽ���ĺ�����,����¼���������

    for j=1:x_size(1)
        if (i<edge(j,4)&&i>edge(j,2))||(i>edge(j,4)&&i<edge(j,2))
            index_p(j)=1;
            count=count+1;
            jd_x(count)=edge(j,1)-((edge(j,3)-edge(j,1))*(edge(j,2)-i))/(edge(j,4)-edge(j,2));
        end
    end
    
%���㰴��x�����С��������
sort_jdx=sort(nonzeros(jd_x));

%���ս������滹��ż�������,ż���������ɶԻ��ߡ�
if rem(count,2)==0
    
    for q=1:(count/2)
        for lj=round(sort_jdx(q*2-1)):round(sort_jdx(q*2))
            plot(lj,i,'r.');hold on;
        end
    end
end
end

