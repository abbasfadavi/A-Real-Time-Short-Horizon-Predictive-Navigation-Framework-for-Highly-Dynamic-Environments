function my_addmesh(scene,x,y,r,h,k)
try
    if k == 0
        addMesh(scene, "cylinder", {[x y r], [0 h]},[0.5 1 0.3]);
    else
        addMesh(scene, "cylinder", {[x y r], [0 h]},[0.5 1 0.8]);
    end
catch
    [x y h]
    pause
end
       