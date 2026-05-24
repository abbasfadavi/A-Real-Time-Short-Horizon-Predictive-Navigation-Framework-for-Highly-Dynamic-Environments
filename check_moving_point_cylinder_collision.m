function hit = check_moving_point_cylinder_collision(p1,p2,b1,b2,gaurd)
hit = 0;
% if abs(p1(1)-b1(1)) + abs(p1(2)-b1(2)) > 65
% return
% end
% if abs(p2(1)-b2(1)) + abs(p2(2)-b2(2))  > 65
% return
% end

p = my_linspace(p1,p2);
b = my_linspace(b1,b2);
for i = 1 : 5
    for j = 1 : size(b,1)
        if (p(i,1)-b(j,1))^2+(p(i,2)-b(j,2))^2   < (b1(:,3) + gaurd)^2
            hit = 1;
            return
        end
    end
end