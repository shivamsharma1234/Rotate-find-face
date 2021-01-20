function Xinter = findfoot(a,b,c)
%     a = [1 1 2]; %line - x1
%     b = [20 28 90]; % line - x2
% 
%     c = [50 30 67]; %point - x0
    a= transp(a);
    b= transp(b);
    c= transp(c);
    ab = b - a; %// Find x2 - x1

    %// -(x1 - x0).(x2 - x1) / (|x2 - x1|^2)
    t = -(a - c)*(ab.') / (ab*ab.'); %// Calculate t

    %// Find point of intersection
    Xinter = transp(a + (b - a)*t);
   
