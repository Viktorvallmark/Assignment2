using Test
using Orthogonalization

function test_gram_schmidt()
    matrix = Matrix{UInt8}(undef, 3,2)

    matrix = gramschmidt!(matrix)

    QtQ = similar(matrix)

    mul!(matrix, transpose(matrix), QtQ)

    @testset "Testing gramschmidt" begin
        @test opnorm(matrix) == 1
        @test opnorm(QtQ) - opnorm(matrix) == 0
        @test eigvals(QtQ) == [abs(1),abs(1),abs(1)]
end

end
