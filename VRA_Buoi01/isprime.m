function m = isprime(n)
    count = 0;
    i = 1;
    while i <= n
       if mod(n, i) == 0
          count = count + 1;
       end
       i = i + 1;
    end
    m = (count == 2);
end