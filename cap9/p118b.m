#Binomial count
#200 trials
#50 realizations
#probability = 1/2
execution = zeros(200, 50);
probability = 1/2;

#realizations for
for realization_index = 1:50
  execution(1, realization_index) = binornd(1, probability);
  #trials for
  for trial_index = 2:200
    execution(trial_index, realization_index) = execution(trial_index-1, realization_index) + binornd(1, probability);
  end
  #figure(realization_index);
  #plot the graph
  hold on;
  plot(1:200,execution(:,realization_index),'--r',1:200);
  legend('p=1/2');
  xlabel('t')
  ylabel('S(t) Binommial Count')
  title('Problem 9.118, letter b, graph');
  #pause(1);
end
  figure
  m=mean(execution');
  v=var(execution');
  plot(1:200, m(1:200), '--k', 1:200, v(1:200), '--b');
  legend('mean','variance');
  xlabel('t')
  ylabel('total of mean,variance')
  title('Problem 9.118, letter b, mean and variance');
  