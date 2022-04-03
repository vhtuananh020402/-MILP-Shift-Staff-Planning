% Matlab code %
clear;
x(1) = input('Please enter a number: ');
k = 2;

while(length(unique(x)) == length(x))
    x(k) = sum((num2str(x(k-1))-'0').^2);
    k = k + 1;
end

if (x(length(x)) == 1)
    fprintf("%d is a happy number\n", x(1));
else
    fprintf("%d is not a happy number\n", x(1));
end

