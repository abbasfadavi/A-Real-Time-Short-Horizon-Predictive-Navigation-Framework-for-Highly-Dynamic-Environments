function [pos_out,ps] = find_path(pos0,bar,t,test_num,v)
gaurd = 7;
ps = [];
%%
%dis = round(min(sqrt((pos0(1) - bar(:,1)).^2 + (pos0(2) - bar(:,2)).^2) - bar(:,3)));

dis_pos = sqrt((pos0(1) - 250).^2 + (pos0(2) - 250).^2);

max_sel = 100000;
% if dis >= 100 
%      max_sel = 500;    
% end
%% escape
bar1 = [bar(:,1:2)+1*v bar(:,3:4)];
pos_out1 = escape(pos0,bar,bar1,[+7,+7]);
crash1 = check_crash_3D(pos0,pos_out1,bar,bar1,0);
pos_out2 = escape(pos0,bar,bar1,[+7,-7]);
crash2 = check_crash_3D(pos0,pos_out2,bar,bar1,0);
pos_out3 = escape(pos0,bar,bar1,[-7,+7]);
crash3 = check_crash_3D(pos0,pos_out3,bar,bar1,0);
pos_out4 = escape(pos0,bar,bar1,[-7,-7]);
if crash1 == 0
    pos_out = pos_out1;
elseif crash2 == 0
    pos_out = pos_out2;
elseif crash3 == 0
    pos_out = pos_out3;
else 
    pos_out = pos_out4;
end
val = 1;
%% line 1
ibest = randi([1,length(val)],1,min(max_sel,length(val)));
pos00 = pos0(ibest,:);
pos1 = [];
bar1 = [bar(:,1:2)+1*v bar(:,3:4)];
for i = 1 : size(pos00,1)
    p = extension1(pos00(i,1:5),bar,bar1,gaurd);
    pos1 = [pos1;repmat(pos00(i,1:5),size(p,1),1) p];
end
if isempty(pos1)
    m=0
    return
else
    val = fitnes(pos1(:,6:10));
    if min(val) == 0
        return
    end
    pos_out = pos1(find(val == min(val),1),6:10);
    q = pos1(find(val == min(val),1),:);
    ps = [q(6:7)];
end
%% line 2
ibest = randi([1,length(val)],1,min(max_sel,length(val)));
pos11 = pos1(ibest,:);
pos2 = [];
bar2 = [bar(:,1:2)+2*v bar(:,3:4)];
for i = 1 : size(pos11,1)
    p = extension1(pos11(i,6:10),bar1,bar2,gaurd);
    pos2 = [pos2;repmat(pos11(i,1:10),size(p,1),1) p];
end
if isempty(pos2)
    m=1
    return
else
    val = fitnes(pos2(:,11:15));
    if min(val) == 0
        return
    end
    pos_out = pos2(find(val == min(val),1),6:10);
    q = pos2(find(val == min(val),1),:);
    ps = [q(6:7);q(11:12)];
end

if dis_pos < 30
    return
end



%% line 3
ibest = randi([1,length(val)],1,min(max_sel,length(val)));
pos22 = pos2(ibest,:);
%
pos3 = [];
bar3 = [bar(:,1:2)+3*v bar(:,3:4)];
for i = 1 : size(pos22,1)
    p = extension1(pos22(i,11:15),bar2,bar3,gaurd);
    pos3 = [pos3;repmat(pos22(i,1:15),size(p,1),1) p];
end
if isempty(pos3)
    m=2
    return
else
    val = fitnes(pos3(:,16:20));
    if min(val) == 0
        return
    end
    pos_out = pos3(find(val == min(val),1),6:10);
    q = pos3(find(val == min(val),1),:);
    ps = [q(6:7);q(11:12);q(16:17)];
end
%% line 4
% ibest = randi([1,length(val)],1,min(max_sel,length(val)));
% pos33 = pos3(ibest,:);
% %
% pos4 = [];
% bar4 = [bar(:,1:2)+4*v bar(:,3:4)];
% for i = 1 : size(pos33,1)
%     p = extension1(pos33(i,16:20),bar3,bar4,gaurd);
%     pos4 = [pos4;repmat(pos33(i,1:20),size(p,1),1) p];
% end
% if isempty(pos4)
%     return
% else
%     val = fitnes(pos4(:,21:25));
%     if min(val) == 0
%         return
%     end
%     pos_out = pos4(find(val == min(val),1),6:10);
%     q = pos4(find(val == min(val),1),:);
%     ps = [q(6:7);q(11:12);q(16:17);q(21:22)];
% end
% t = 1000*toc;
% if t > 500
%     return
% end
% %% line 5
% ibest = randi([1,length(val)],1,min(max_sel,length(val)));
% pos44 = pos4(ibest,:);
% %
% pos5 = [];
% bar5 = [bar(:,1:2)+5*v bar(:,3:4)];
% for i = 1 : size(pos44,1)
%     p = extension1(pos44(i,21:25),bar4,bar5,gaurd);
%     pos5 = [pos5;repmat(pos44(i,1:25),size(p,1),1) p];
% end
% if isempty(pos5)
%     return
% else
%     val = fitnes(pos5(:,26:30));
%     if min(val) == 0
%         return
%     end
%     pos_out = pos5(find(val == min(val),1),6:10);
%     q = pos5(find(val == min(val),1),:);
%     ps = [q(6:7);q(11:12);q(16:17);q(21:22);q(26:27)];
% end
% %% line 6
% ibest = randi([1,length(val)],1,min(max_sel,length(val)));
% pos55 = pos5(ibest,:);
% %
% pos6 = [];
% bar6 = [bar(:,1:2)+6*v bar(:,3:4)];
% for i = 1 : size(pos55,1)
%     p = extension1(pos55(i,26:30),bar5,bar6,gaurd);
%     pos6 = [pos6;repmat(pos55(i,1:30),size(p,1),1) p];
% end
% if isempty(pos6)
%     return
% else
%     val = fitnes(pos6(:,31:35));
%     if min(val) == 0
%         return
%     end
%     pos_out = pos6(find(val == min(val),1),6:10);
%     q = pos6(find(val == min(val),1),:);
%     ps = [q(6:7);q(11:12);q(16:17);q(21:22);q(26:27);q(31:32)];
% end
%%
if pos_out(1) < 80 & pos_out(2) < 80
    pos_out(3) = clip(pos_out(3) + 1,1,100);
end

if pos_out(1) > 200 & pos_out(2) > 200
    pos_out(3) = clip(pos_out(3) - 1,1,100);
end

% p1 = pos_out;
% p1(3) = clip(p1(3) + 1,1,100);
% val1 = fitnes(p1(:,1:5));
% p2 = pos_out;
% p2(3) = clip(p2(3) + 0,1,100);
% val2 = fitnes(p2(:,1:5));
% p3 = pos_out;
% p3(3) = clip(p3(3) - 1,1,100);
% val3 = fitnes(p3(:,1:5));
% val = [val1 val2 val3];
% i = find(val == min(val),1);
% p = [p1;p2;p3];
% pos_out = p(i,:);







