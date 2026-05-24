% UAV Path Planning in Dynamic Threat Environments
clc, clear all,close all
rng(0)
format compact
format longG
%%
sr = zeros(1,5);
t = 0;
for num_bar = 10 : 10 : 50
    for test_num = 1 : 200
        [crash(test_num),min_dis(test_num),path_time(test_num),path_length(test_num),tpf(test_num),psi(test_num)] = main_process(num_bar,test_num);
    end
    success_rate = round(100*mean(~crash));
    min_dis      = round(mean(min_dis));
    path_time    = round(mean(path_time));
    path_length  = round(mean(path_length));
    computation_time = round(1000*mean(tpf));%ms
    sps1 = round(mean(psi));
    t = t + 1;
    result(t,:) = [num_bar,success_rate,min_dis,path_time,path_length,computation_time]
end
writematrix(result,'matrix.xlsx');