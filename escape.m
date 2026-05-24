function pos_out = escape(pos0,bar,bar1,x)

pos_out = [clip(pos0(1:2) + x,1,300) pos0(3:5)];
pos_out(4) = round(mod(rad2deg(atan2(pos_out(2)-pos0(2),pos_out(1)-pos0(1))),360));
