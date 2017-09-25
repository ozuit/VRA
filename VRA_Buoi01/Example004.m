function Example004()
    n = input('\n Nhap n: ');
    s = 0;
    for i = 1:n
        s = s + i;
    end
    fprintf('\n Tong S = 1+2+...+%d la %d',n,s);
end