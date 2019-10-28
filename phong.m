clear all;
figure(1);

for i=0:200
    
    for j=0:200
        xlim([0,300]);
        ylim([0,300]);
        t0=(100*100-sqrt(40*40*100*100-8400*(i-120)*(i-120)))/((i-120)*(i-120)+100*100);
        %计算交点的t0值

        x0=120+t0*(i-120);
        y0=t0*j;
        z0=100-100*t0;
        %交点坐标
        
        if (((i-120)*(i-120)*t0*t0+100*100*(1-t0)*(1-t0)-1600<=1e-8))&&((x0<=160)&&(x0>=80))&&((y0<=100)&&(y0>=20))&&((z0<=40)&&(z0>=0))&&((40*40*100*100-8400*(i-120)*(i-120))>=0)
        %如果对于视点来说这一点是曲面的投影点，则按照phone模型计算
       
        
            point_A=[t0*(i-120)+120 t0*j 100-100*t0];
            light_source=[120 80 100];
            veiw_point=[120 0 100];
            vector_L=point_A-light_source;
            vector_V=veiw_point-point_A;
        %用vector_L表示从物体表面上的A点到光源的方向向量 vector_V表示从人眼出发到物体表面的A点的方向向量
            vector_H=(vector_L+vector_V)/(normest(vector_L+vector_V));
            vector_N=[x0-120 0,z0];
            Ed=dot(vector_L,vector_N)/(normest(vector_L)*normest(vector_N));
            Es=dot(vector_N,vector_H)/(normest(vector_N)*normest(vector_H));
        %vector_N为该点的法向量vector_H为反射光的反方向
        %Ed为L与N夹角的cos值，夹角越小，cos值越大，反射光越强
        %Es为N与H夹角的cos值，夹角越小，说明反射光方向和视角方向越靠近，对于光滑平面，显然越靠近越亮
            ka=1;kd=1;ks=1;
            rgb=ka*[0.4,0.6,0.7]+kd*[0.2,0.3,0.5]*Ed+ks*[0.2,0.3,0.5]*Es;
        %phong模型由环境光，漫反射光，镜面光三种模型叠加
            plot(i,j,'.','Color',rgb);
            hold on;
        else
            plot(i,j,'.','Color',[0,0,1]);
        %如果对于视点来说视点来说这一点不是曲面的投影点，则用背景色计算
        end
    end
end
