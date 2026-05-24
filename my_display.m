function my_display(bar0,bar1,pos,num_bar,test_num,t,ps) 
bouand = 300;
scene = uavScenario("UpdateRate",100,"StopTime",0.5);

    addMesh(scene,"Polygon", {[1 1; bouand 1; bouand bouand; 1 bouand], [-2 0]}, [0.3 0.3 0.3]);
    for i = 1 : num_bar
        %my_addmesh(scene,bar0(i,1),bar0(i,2),bar0(i,3),bar0(i,4),0);
        my_addmesh(scene,bar1(i,1),bar1(i,2),bar1(i,3),bar1(i,4),1);  

        %plot(bar0(i,1),bar0(i,1),'o', 'MarkerFaceColor', 'g',MarkerSize=5);
    end
    show3D(scene);
    axis([0 bouand 0 bouand 0 70]);
    title(sprintf('num bar = %d, test num = %d',num_bar,test_num));
    hold on
    plot3(pos(:,1),pos(:,2),pos(:,3), 'LineWidth',1,'Color',[0 0 1]);
    plot(40:60,40*ones(1,21), 'LineWidth',1,'Color',[1 1 0]);
    plot(40:60,60*ones(1,21), 'LineWidth',1,'Color',[1 1 0]);
    plot(40*ones(1,21),40:60, 'LineWidth',1,'Color',[1 1 0]);
    plot(60*ones(1,21),40:60, 'LineWidth',1,'Color',[1 1 0]);
    plot(240:260,240*ones(1,21), 'LineWidth',1,'Color',[1 1 0]);
    plot(240:260,260*ones(1,21), 'LineWidth',1,'Color',[1 1 0]);
    plot(240*ones(1,21),240:260, 'LineWidth',1,'Color',[1 1 0]);
    plot(260*ones(1,21),240:260, 'LineWidth',1,'Color',[1 1 0]);
    plot(pos(end,1), pos(end,2),'o', 'MarkerFaceColor', 'r',MarkerSize=6);
    if ~isempty(ps)
        plot(ps(:,1),ps(:,2),'o', 'MarkerFaceColor', 'r',MarkerSize=3);
    end
    view(90,90)
    drawnow
    hold off