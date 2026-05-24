function val = fitnes(pos)
a = (pos(:,1) - 250).^2;
b = (pos(:,2) - 250).^2;
c = (pos(:,3) - 1).^2;
val = sqrt( a + b + c);



%[val sum(sum(abs(bar(:,1:2)-pos(:,1:2)),2)<100)]








