#Sum process of a Poissom Variable
#Xn = poissom
#10 realizations
#200 trials
#lambda = 1
execution = zeros(200, 10);
lambda = 1

#realization for
for realization_index = 1:10
  #first element
  execution(1, realization_index) = poissrnd(lambda);
  for trial_index = 2:200
    execution(trial_index, realization_index) = execution(trial_index-1 , realization_index) + poissrnd(lambda);
  end
  #figure(sample);
  hold on;
  plot(1:200, execution(:,realization_index), '--');
  xlabel('t')
  ylabel('S(t), Sum process of Poissom')
  title('Problem 9.121, letter a');
end