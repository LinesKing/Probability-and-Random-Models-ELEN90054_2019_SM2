function [s] = Dicegame(n)%%n is the number of times you play the game

s=0;
for t=1:n
i=1;
a(1) = randi(2);%%The value of 1st dice
b(1) = randi(2);%%The value of 2nd dice
x(1) = a(1)+b(1);%%The value of the sum
while x(1) ~=2
    i=i+1;
    a(i) = randi(2);%%The value of 1st dice
    b(i) = randi(2);%%The value of 2nd dice
    x(i) = a(i)+b(i);%%The value of the sum
    if x(i) == 2
        x=0;
        break
    else if x(i) == x(1)
            s=s+1;
            x=0;
            break
        else 
            continue
        end
    end
end
end
end