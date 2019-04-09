#Binomial count
#200 trials
#50 realizations
#4 slices (increment)
#50 trials each slices
#probability = 1/2
execution = zeros(200, 50);
probability = 1/2;
increments = zeros(4, 50);

#realizations for
for realization_index = 1:50
  execution(1, realization_index) = binornd(1, probability);
  #trials for
  for trial_index = 2:200
    execution(trial_index, realization_index) = execution(trial_index-1, realization_index) + binornd(1, probability);
  end
  
  #add to increments
  increments(1, realization_index)= execution(50,realization_index) - execution(1, realization_index);
  increments(2, realization_index)= execution(100, realization_index) - execution(51, realization_index);
  increments(3, realization_index)= execution(150, realization_index) - execution(101, realization_index);
  increments(4, realization_index)= execution(200, realization_index) - execution(151, realization_index);
  
  #figure(realization_index);
  #plot the graph
  #hold on;
  #plot(1:200,execution(:,realization_index),'--r',1:200);
  #legend('p=1/2');
  #xlabel('t')
  #ylabel('S(t) Binommial Count')
  #title('Problem 9.118, letter c, graph');
  #pause(1);
end
  #figure
  #m=mean(execution');
  #v=var(execution');
  #plot(1:200, m(1:200), '--k', 1:200, v(1:200), '--b');
  #legend('mean','variance');
  #xlabel('t')
  #ylabel('total of mean,variance')
  #title('Problem 9.118, letter c, mean and variance');

  figure
  hist(increments(1,:),5);
  xlabel('increments [1-50]');
  ylabel('number of samples');
  
  figure
  hist(increments(2,:),5);
  xlabel('increments [51-100]');
  ylabel('number of samples');

  figure
  hist(increments(3,:),5);
  xlabel('increments [101-150]');
  ylabel('number of samples');

  figure
  hist(increments(4,:),5);
  xlabel('increments [151-200]');
  ylabel('number of samples');
