function Example001()
    m = input('\n Nhap m: ');
    n = input('\n Nhap n: ');
    a = ones(m,n);
    b = zeros(m,n);
    c = eye(m,n);
    d = randi([-10,10],m,n);
    a(1,1) = 5;
    e = size(a);
end