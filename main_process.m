function [crash,min_dis,path_time,path_length,tpf,psi] = main_process(num_bar,test_num)
%num_bar = test_num;
% pos: x,y,z,yaw,pitch
% bar: x,y,r,h
%% Initialize
bar = set_up1(num_bar);
tic
t = 1;
pos(t,:) = [51 51 1 45 0];
min_dis = [];
psi = [];
crash = 0;
%% start
np = 5;
nb = 5;
while norm(pos(end,1:2)-[250 250]) > 5 && crash == 0
    if t == 1
        vp = zeros(size(bar,2),2);
    else
        vp = round(squeeze(bar(t,:,1:2)) - squeeze(bar(t-1,:,1:2)));
    end
    %
    [pos(t+1,:),ps] = find_path7(pos(t,:),np,nb,squeeze(bar(t,:,:)),vp);
    nb = (np+1 - size(ps,1))*150;
    t = t + 1;
    my_display(squeeze(bar(t-1,:,:)),squeeze(bar(t,:,:)),pos,num_bar,test_num,t,ps)
    crash = check_crash(pos(t-1,:),pos(t,:),squeeze(bar(t-1,:,:)),squeeze(bar(t,:,:)),0);
    if crash > 0
        crash;
    end
    distance = round(min(sqrt((pos(t,1) - squeeze(bar(t,:,1))).^2 + (pos(t,2) - squeeze(bar(t,:,2))).^2) - squeeze(bar(t,:,3))));
    if isempty(distance)
        distance = 241;
    end
    min_dis(t) = distance;
    psi(t) = size(ps,1);
    %%
end
path_time = size(pos,1);
path_length = sum(sqrt(sum(diff(pos(:,1:3)).^2,2)));
tpf = toc/path_length;
min_dis = min(distance);
psi = mean(psi(1:end-3));



