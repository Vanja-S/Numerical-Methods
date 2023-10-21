# Beri vnos uporabnika za red matrike A, oz. število 
println("Vnesite red matrike A, njej se doda stolpec rezultatov za razširjeno matriko:")
n = parse(UInt64, readline())

A = rand(n, n + 1)
L = zeros(n, n)

println("Začetna matrika:")
display(A)

## Gaussova Eliminacija ##

for k in 1:n-1
    for i in k+1:n
        L[i, k] = A[i, k] / A[k, k]
        A[i, k] = zero(A[i, k])
        for j in k+1:n
            A[i, j] = A[i, j] - L[i, k] * A[k, j]
        end
        A[i, n+1] = A[i, n+1] - L[i, k] * A[k, n+1]
    end
end

##########################

println("\nAugmentirana Matrika [A|b]:")
display(A)

println("\nZgornje Trikotna Matrika U:")
U = A[:, 1:n]
display(U)

c = A[:, n+1]

## Obratna substitucija ##

x = [NaN for i = 1:n, j = 1:1]

x[n] = c[n] / U[n, n]
for i = range(n - 1, 1, step=-1)
    sum = c[i]
    for j = range(i + 1, n, step=1)
        sum = sum - U[i, j] * x[j]
    end
    x[i] = sum / U[i, i]
end

##########################

println("\nKončna matrika rešitev x:")
display(x)