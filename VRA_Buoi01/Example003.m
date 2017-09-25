function Example003()
    n = input('\n Nhap n: ');
    s = 0;
    i = 1;
    while i <= n
        s = s + i;
        i = i + 1;
    end
    fprintf('\n Tong S = 1+2+...+%d la %d',n,s);
end