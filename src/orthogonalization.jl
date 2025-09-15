module Orthogonalization

using LinearAlgebra

export gramschmidt


function gramschmidt!(matrix::Matrix{UInt8})

    temp = matrix
    
    #first step in the modified Gram-Schmidt, replacing all columns with first column
    matrix .= temp[:, 1]

    for i in eachindex(matrix)
        r_ii = norm(matrix[:,i])
        if r_ii ≈ 0
            q_i = zeros(size(matrix, 1))
        end
        q_i = matrix[:, 1] / r_ii
        j = i + 1
        for j in eachindex(matrix)
            
        end
    end
    


end
end