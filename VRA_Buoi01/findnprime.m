function arrPrime = findnprime(n)
    count = 0;
    i = 2;
    arrPrime = [];
    while count < n
        if isprime(i)
           count = count + 1;
           arrPrime = [arrPrime, i];
        end
        i = i + 1;
    end
end