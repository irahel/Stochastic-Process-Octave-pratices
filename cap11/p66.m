%gamblers’ experiment
%2 friends playing a game
% a fair coin is tossed
% if the result is head player a pay 1$ to player b
% if the result is tail player b pay 1$ to player a

clear all;

%initial cash
a = 6;
b = 3;
rod = 0;

for realization = 1:500
  while a > 0 && b > 0
    random_play = rand;
    if random_play < .5
      %b pays a
      a += 1;
      b -= 1;
    else
      %a pays b
      a -=1;
      b += 1;
    end
    rod += 1;
  end
  final_ans(realization) = rod;
end

hist(final_ans)