A = rand(3, 3)
L = zeros(3, 3)

display(A)
display(L)

for k in 1:3
    for i in k+1:3
        L[i, k] = A[i, k] / A[k, k]
        A[i, k] = zero(A[i, k])

        for j in k+1:3
            A[i, j] = A[i, j] - L[i, k] * A[k, j]
        end
    end
end

display(A)
display(L)