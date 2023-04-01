#Experiment 5
#I19PH004 Keith Kamson Fernandes
#Random Numbers using LCG, Midsquare and Octave RND

#LCG method
# x(i+1) = [a*x(i) + c]*mod|m|
x = [5];
a = 1;
c = 4;
m = 100;
N = 10000;

for i=1:N,
  x(i+1) = mod(a*x(i) + c,m);
end
x = x./m;

#Midsquare method
#x=(seed)^2
#take middle 4 digits which will give us the output seed
y = [4269];

for l=1:N,
y(l+1) = y(l)*y(l);
y(l+1) = y(l+1)/100;
y(l+1) = int16(rem(y(l+1), 10000));
endfor

y = y./9999;

#Octave Random Number Genarator
z = [.034354353453465];
for m=1:N,
  z(m+1) = rand();
end

rnd = [x;y;z]';
dlmwrite("rnd.csv", rnd);
