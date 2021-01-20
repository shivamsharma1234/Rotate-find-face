function [ output_args ] = DrawRotatedPolyhedron(M,P)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here

%P= pyramid;

cell_size = size(P);
figure 
hold on
for i=1:cell_size(1,2) 
    
    len = size(P{1,i});
    
    for L=1:len(1,2)
        P{1,i}(:,L) = M*P{1,i}(:,L);
    end
    x=[P{1,i}(1,:),P{1,i}(1,1)]; %t = [t,cube{1,i}(1,1)]
    y=[P{1,i}(2,:),P{1,i}(2,1)];
    
    a = P{1,i}(:,1);
    b = P{1,i}(:,2);
    c = P{1,i}(:,3);
    cross_prod = cross((c-b),(a-b));
    disp(cross_prod)
    if cross_prod(3,1)<0
        plot(x,y)
        
        %circle center
        c_x = mean(P{1,i}(1,:));
        c_y = mean(P{1,i}(2,:));
        c_z = mean(P{1,i}(3,:));
        fprintf('\nCircle Center %f, %f \n',c_x,c_y)
        %find radius of circle
        size_M = size(P{1,i});
        radius = 10000;
        temp = 100000;
        for j=1:size_M(1,2)

            pt = [c_x,c_y,c_z];
            if j~=size_M(1,2)
                v1 = P{1,i}(:,j);
                v2 = P{1,i}(:,j+1);
            else
                
                v1 = P{1,i}(:,j);
                v2 = P{1,i}(:,1);
            end
            radius = min(radius,point_to_line(pt, transp(v1), transp(v2)));
            fprintf('\nMin radius is : %f, %f',radius,point_to_line(pt, transp(v1), transp(v2)))
            
        end
        radius = radius/2;
        fprintf('\nFinal radius is : %f',radius)
        disp('yes')
        %p_distance =
        
        %find vector u and v
        u_vec = b-a;
        v_vec = findfoot(a,b,c)-c;
        
        N =10000;
        t = linspace(0,N);
        
        r_1 = radius*cos((2*pi*t)/N);
        r_2 = radius*sin((2*pi*t)/N);
        circle_cord = [c_x;c_y;c_z]+ r_1(1,1)*u_vec + r_2(1,1)*v_vec;
        for k=2:length(r_1)
            circle_cord = [circle_cord,[c_x;c_y;c_z]+ r_1(1,k)*u_vec + r_2(1,k)*v_vec];
        end
        
        plot(circle_cord(1,:),circle_cord(2,:))
    end
    
    
   
end
hold off




end

