function mat = find_points(pos0,bar0,bar1,gaurd)
mat = zeros(39,5);
i=0;
for v = -10:10:+10
    for omega = -90:15:+90
        i = i + 1;
        x_next = pos0(1) + round(v * cos(deg2rad(omega)));
        y_next = pos0(2) + round(v * sin(deg2rad(omega)));
        theta_next = pos0(4) + omega;
        y = [x_next y_next 1 theta_next pos0(5)];
        c = check_crash(pos0,y,bar0,bar1,gaurd);
        if c == 0
            mat(i,:) = y;
        else
            mat(i,:) = zeros(1,5);
        end
    end
end