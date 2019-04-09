#Binomial count
#200 trials
#10 realizations
#3 probability
execution = zeros(200, 10, 3);
probability = [1/4, 1/2, 3/4];

#realizations for
for realization_index = 1:10
  #probabilities for
  for probability_index = 1:3
    execution(1, realization_index, probability_index) = binornd(1, probability(probability_index));
    #trials for
    for trial_index = 2:200
      execution(trial_index, realization_index, probability_index) = execution(trial_index-1, realization_index, probability_index) + binornd(1, probability(probability_index));
    end
  end
  #figure(realization_index);
  #plot the graph
  hold on;
  plot(1:200,execution(:,realization_index,1),'--r',1:200,execution(:,realization_index,2),'--k',
  1:200, execution(:,realization_index,3), '--b');
  legend('p=1/4', 'p=1/2', 'p=3/4');
  xlabel('t')
  ylabel('S(t) Binommial Count')
  title('Problem 9.118, letter a');
  pause(1);
end