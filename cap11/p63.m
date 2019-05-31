%An urn contains 5 balls white and 5 balls blackman
%a random ball is selected randomly
%if the selected ball is black he is discarded
%if the selected ball is white he is puted back on the urn

clear all;

black_balls = 5;
white_balls = 5;
iterator = 0;

for realizations=1:100
  while(black_balls > 0)    
    if binornd(1, (black_balls/(black_balls+white_balls))) == 1
      black_balls -= 1;
    end
    iterator += 1
  end
  #reset
  final_ans(realizations) = iterator;
  black_balls = 5;
  iterator = 0;
end
hist(final_ans);