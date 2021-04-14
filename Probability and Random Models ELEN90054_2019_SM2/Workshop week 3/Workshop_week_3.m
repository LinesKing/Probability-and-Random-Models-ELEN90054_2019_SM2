clear all
close all
clc

%% Part 1 Dice game
%% I-a)
X = [2 3 4];
p = [0.25 0.5 0.25];
stem(X,p);
axis([0 6 0 1]);
xlabel('T(1)');
ylabel('pmf');

%% I-i)
[s] = Dicegame(10);
wf1=s/10%When n=10, the fraction of times the player wins rolling the dice with only 1 spot and 2 spots.

%% I-j)
[s] = Dicegame(50000);
wf2=s/50000%When n=50000, the fraction of times the player wins rolling the dice with only 1 spot and 2 spots.

%% I-I)
[s] = Dicegame6(10);
wf61=s/10%When n=10, the fraction of times the player wins rolling the normal dice.
[s] = Dicegame6(50000);
wf62=s/50000%When n=50000, the fraction of times the player wins rolling the normal dice.

%% Part 2 MontyHall game
%% The player stickes
[win] = MontyHallgamestick(10);
wfstick1=win/10%When n=10, the fraction of times the player wins for sticking.
[win] = MontyHallgamestick(50000);
wfstick2=win/50000%When n=50000, the fraction of times the player wins for sticking.

%% The player switches
[win] = MontyHallgameswitch(10);
wfswitch1=win/10%When n=10, the fraction of times the player wins for switching.
[win] = MontyHallgameswitch(50000);
wfswitch2=win/50000%When n=50000, the fraction of times the player wins for switching.