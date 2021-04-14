function [win] = MontyHallgameswitch(n)%%n is the number of times you play the game
win=0;
for i=1:n
car = randi(3);%%The number of the door with a car behind
choice = randi(3);%%The number of the door the player choose
change = 2;%change=2 means switching
if ((choice == car)&&(change == 1)) || ((choice ~= car)&&(change == 2))
    win = win+1;
else
    win = win;
end
end
end

