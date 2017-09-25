function savenprime(n)
    arrPrimes = findnprime(n);
    fileName = ['prime', num2str(n), '.mat'];
    save(fileName, 'arrPrimes');
end