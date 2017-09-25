function loadnprime(n)
    fileName = ['prime', num2str(n), '.mat'];
    load(fileName);
    arrPrimes
end