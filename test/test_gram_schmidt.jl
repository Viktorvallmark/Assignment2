using Test
using Orthogonalization

function test_gram_schmidt()

    print("enter the column dimension: ")
    n = chomp(readline())
    m = n +2

    matrix = Matrix{UInt8}(undef, m, n)

    matrix = gramschmidt!(matrix)

    QtQ = similar(matrix)

    mul!(matrix, transpose(matrix), QtQ)

    @testset "Testing gramschmidt" begin
        @test opnorm(matrix) == 1
        @test opnorm(QtQ) - opnorm(matrix) == 0
        @test eigvals(QtQ) == fill(abs(1), size(QtQ,2))
        @test det(matrix) != 0
    end

end

function test_qr()

    print("enter the column dimension: ")
    n = chomp(readline())
    m = n +2

    qr_mat = qr(rand(m,n))
    Q_mat = qr_mat.Q
    QtQ = similar(matrix)
    mul!(matrix, transpose(matrix), QtQ)

    @testset "Testing QR" begin
        @test opnorm(Q_mat) 
        @test opnorm(QtQ) - opnorm(Q_mat) == 0
        @test eigvals(QtQ) == fill(abs(1), size(QtQ,2))
        @test det(Q_mat) != 0
    end
end
