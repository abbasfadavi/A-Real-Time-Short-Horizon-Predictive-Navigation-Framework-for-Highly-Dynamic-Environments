function pp = my_linspace(p1,p2)
a1 = min(p1(1),p2(1));
b1 = max(p1(1),p2(1));
c1 = (b1 - a1)/4;
a2 = min(p1(2),p2(2));
b2 = max(p1(2),p2(2));
c2 = (b2 - a2)/4;
pp = zeros(5,2);
for i = 1 : 5
    pp(i,1) = a1 + (i-1)*c1;
    pp(i,2) = a2 + (i-1)*c2;
end