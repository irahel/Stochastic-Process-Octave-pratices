#Binomial count
#200 trials
#50 realizations
#2 slices (increment)
#50 trials each slices
#probability = 1/2
execution = zeros(200, 50);
execution_test = zeros(200, 50);
probability = 1/2;
probability_test = 4/5;
increments = zeros(2, 50);
increments_test = zeros(2, 50);

#realizations for
for realization_index = 1:50
  execution(1, realization_index) = binornd(1, probability);
  execution_test(1, realization_index) = binornd(1, probability_test);
  #trials for
  for trial_index = 2:200
    execution(trial_index, realization_index) = execution(trial_index-1, realization_index) + binornd(1, probability);
    if trial_index < 50
      #first increment
      #exec in high success rate
      execution_test(trial_index, realization_index) = execution_test(trial_index-1, realization_index) + binornd(1, probability_test);
    else
      #second increment
      #back to normal prob
      execution_test(trial_index, realization_index) = execution_test(trial_index-1, realization_index) + binornd(1, probability);
    end
  end
  
  #add to increments
  increments(1, realization_index)= execution(50,realization_index) - execution(1, realization_index);
  increments(2, realization_index)= execution(100, realization_index) - execution(51, realization_index);
 
  increments_test(1, realization_index)= execution_test(50,realization_index) - execution_test(1, realization_index);
  increments_test(2, realization_index)= execution_test(100, realization_index) - execution_test(51, realization_index);
  
  #figure(realization_index);
  #plot the graph
  #hold on;
  #plot(1:200,execution(:,realization_index),'--r',1:200);
  #legend('p=1/2');
  #xlabel('t')
  #ylabel('S(t) Binommial Count')
  #title('Problem 9.118, letter d, graph');
  #pause(1);
end
  #figure
  #m=mean(execution');
  #v=var(execution');
  #plot(1:200, m(1:200), '--k', 1:200, v(1:200), '--b');
  #legend('mean','variance');
  #xlabel('t')
  #ylabel('total of mean,variance')
  #title('Problem 9.118, letter d, mean and variance');
  

  subplot(2, 2, 1)
  plot(increments(1,:),'*b');
  increments(2,:),'*k'
  xlabel('first increment');
  ylabel('second increment');
  axis([1 50 1 50]);
  title('Problem 9.118, letter d, 1:50 NORMAL');
  
  subplot(2, 2, 2)
  plot(increments(2,:),'*k');
  xlabel('first increment');
  ylabel('second increment');
  axis([1 50 1 50]);
  title('Problem 9.118, letter d, 51:100 NORMAL');
  
  subplot(2, 2, 3)
  plot(increments_test(1,:),'*b');  
  xlabel('first increment');
  ylabel('second increment');
  axis([1 50 1 50]);
  title('Problem 9.118, letter d, 1:50 TEST');
  
  subplot(2, 2, 4)
  plot(increments_test(2,:),'*k');
  xlabel('first increment');
  ylabel('second increment');
  axis([1 50 1 50]);
  title('Problem 9.118, letter d, 51:100 TEST');
  