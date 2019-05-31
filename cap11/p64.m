clear all;

ro = 20;
for experiment = 1:2
  if experiment == 1
    for i = 1:5
      for realizations = 1:200
        c1_w = floor((ro+1)*rand);
        c1_b = 20-c1_w;
        
        c2_w = 20-c1_w;
        c2_b = 20-c2_w;
        
        f1 = floor((ro+1)*rand);
        f2 = floor((ro+1)*rand);
        
        if f1 <= c1_w
          c2_w += 1;
          c1_w -= 1;
        else
          c2_b += 1;
          c1_b -= 1;
        end
         
        if f2 <= c2_w
          c1_w += 1;
          c2_w -= 1;
        else
          c1_b += 1;
          c2_b -= 1;
        end
        
        final_ans(realizations) = c1_w;
      end
      figure;
      hist(final_ans)
     end
  else
     for realizations = 1:1000
        c1_w = floor((ro+1)*rand);
        c1_b = 20-c1_w;
        
        c2_w = 20-c1_w;
        c2_b = 20-c2_w;
        
        f1 = floor((ro+1)*rand);
        f2 = floor((ro+1)*rand);
        
        if f1 <= c1_w
          c2_w += 1;
          c1_w -= 1;
        else
          c2_b += 1;
          c1_b -= 1;
        end
         
        if f2 <= c2_w
          c1_w += 1;
          c2_w -= 1;
        else
          c1_b += 1;
          c2_b -= 1;
        end
        
        final_ans(realizations) = c1_w;
      end
      figure;
      hist(final_ans)
  end
end