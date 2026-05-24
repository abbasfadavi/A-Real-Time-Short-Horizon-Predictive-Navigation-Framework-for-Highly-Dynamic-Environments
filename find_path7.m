function [pos_out,ps,sit] = find_path7(pos0,np,nb,bar,v)
pos_out = pos0;
%% lines
dis_pos = sqrt((pos0(1) - 250).^2 + (pos0(2) - 250).^2);
ps = [];
val = 1;
pos = pos0;
for n = 1:np
    [val,ibest] = sort(val);
    pos = pos(ibest,:);
    %
    b1 = [bar(:,1:2)+(n-1)*v bar(:,3:4)];
    b2 = [bar(:,1:2)+(n-0)*v bar(:,3:4)];
   %
    pos1 = zeros(39*length(val),(n+1)*5);
    for i = 1 : min(size(pos,1),nb)
        p = find_points(pos(i,n*5-4:n*5),b1,b2,1+2*(n-1));
        pos1(i*39-39+1:i*39,:) = [repmat(pos(i,1:n*5),size(p,1),1) p];
    end
    pos1(all(pos1(:,end-4:end)==[0 0 0 0 0],2),:)=[];
    if isempty(pos1) 
        sit = 3;
        return
    else
        val1 = fitnes(pos1(:,n*5+1:n*5+5));
        pos_out = pos1(find(val1 == min(val1),1),6:10);
        q = pos1(find(val1 == min(val1),1),:);
        ps = [q(6:5:5*n+1);q(7:5:5*n+2)]';
    end
    if dis_pos <= n*10+1
        sit = 1;
        return
    end
    pos=pos1;
    val=val1;
end
%%
sit = 0;
%disp('predict ok')












