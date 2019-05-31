%Each time unit a data multiplexer receives a packet with probability a, and/or transmits a
%packet from its buffer with probability b.

clear all;

n = 100;
b = .5;
a = .5;
X = 0;

for variants = 1:3
  if variants == 1
    a = .1
  end
  if variants == 2
    a = .25
  end
  if variants == 3
    a = .5
  end
  for realizations = 1:1000
    p1 = rand;
    p2 = rand;
    
    %prob to transmit
    if p1 < a
      if X < n
        X += 1;
      end
    end
    %prob to receive
    if p2 < b
      if X > 0
        X -= 1;
      end
    end
    
    final_ans(realizations) = X;
  end
  figure;
  hist(final_ans);
end