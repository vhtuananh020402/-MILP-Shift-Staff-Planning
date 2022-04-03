%input data
A = readmatrix('data.xlsx','Sheet','coefficient')*-1;
f = readmatrix('data.xlsx','Sheet','obj').';
b = readmatrix('data.xlsx','Sheet','RHS')*-1;
[row, col] = size(A);

% optimize
N = row;
lb = zeros(N, 1);
intcon = 1:N;
x = intlinprog(f, intcon, A, b, [], [], lb);

% print the result
fprintf("objective optimization: %d\n", sum(x))
for m = 1 : N
    fprintf("x%d = %d\n", m, x(m))
    for k = 1 : N
        rhs_result(m,k) = A(m, k) .* x(k) *-1;
    end
end

constraint_res = sum(rhs_result, 2);
for m = 1 : N
    fprintf("Constraits #%3d = %d   | Requirement: %d\n", m, constraint_res(m), b(m)*-1)
end