function bar_out = set_up1(num_bar)
vmax = 15;
bar_out = zeros(200,num_bar,4);
bar(:,:) = [randi([1,300],num_bar,2) randi([7,10],num_bar,1) randi([5,50],num_bar,1)];
v = randi([-11,11],num_bar,2);
for i = 1 : num_bar
    if norm(bar(i,1) - 50) < 100 && norm(bar(i,2) - 50) < 100
        bar(i,1:2) = bar(i,1:2) + 100;
    end
    if norm(v(i,:)) > vmax
        v(i,:) = v(i,:) / norm(v(i,:)) * vmax;
    end
end
bar_out(1,:,:) = bar;
for t = 2 : 200-1
    bar(:,1:2) =  bar(:,1:2) + v;
    %% sensor
    sensore_noise = sqrt(2)*[randi([-1,1],size(v,1),2)];
    bar(:,1:2) =  bar(:,1:2) + sensore_noise;
    %%
    r = find(bar(:,1) < 1);
    v(r,1) = -v(r,1);
    r = find(bar(:,2) < 1);
    v(r,2) = -v(r,2);
    r = find(bar(:,1) >= 300);
    v(r,1) = -v(r,1);
    r = find(bar(:,2) >= 300);
    v(r,2) = -v(r,2);
    %%
    if mod(t,10) == 9 && size(v,1) > 0
        r = randi([1,size(v,1)],1,2);
        aa = v(r(1),:);
        v(r(2),:) = v(r(1),:);
        v(r(1),:) = aa;
    end
    %%
    bar = min(max(round(bar),1),300);
    bar_out(t,:,:) = bar;
end

