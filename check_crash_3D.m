function c = check_crash_3D(p1, p2, b1, b2,gaurd)
bouand = 300;
c = 0;
%% Boundary check
if p2(1) < 1 || p2(1) > bouand || p2(2) < 1 || p2(2) > bouand || p2(3) < 1 || p2(3) > bouand
    c = 1;
    return;
end
%% Yaw constraint
[p1(4)   p2(4)];
yaw_diff = abs(p1(4) - p2(4));
yaw_diff = min(yaw_diff, 360 - yaw_diff);
if yaw_diff > 90
    c = 2;
    return;
end
%% Pitch constraint
if abs(p1(5) - p2(5)) > 30
    c = 3;
    return;
end
%% Step length constraint 
step_dist = norm(p2(1:2) - p1(1:2));
if step_dist > 10
    c = 4;
    return;
end
%%
%% Step length constraint 
step_dist = abs(p2(3) - p1(3));
if step_dist > 1
    c = 5;
    return;
end
%% Collision with moving spherical obstacles
if ~isempty(b1)
    for i = 1:size(b1,1)
        hit = check_moving_point_cylinder_collision(p1(1:3), p2(1:3), b1(i,:), b2(i,:),gaurd);
        if hit
            c = 6;
            return;
        end
    end
end
end
