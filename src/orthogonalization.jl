module Orthogonalization

using LinearAlgebra

export gramschmidt


function gramschmidt!(matrix)

    temp = matrix
    
    #first step in the modified Gram-Schmidt, replacing all columns with first column
    matrix .= temp[:, 1]

    for i in 1:axes(matrix)
        r_ii = norm(matrix[:,i])
        if r_ii ≈ 0
            q_i = zeros(size(matrix, 1))
        end
        q_i = matrix[:, i] / r_ii
        j = i + 1
        for j in axes(matrix)
            r_ij = dot(transpose(q_i), temp[:, j])
            matrix[:,j] = temp[:,j] - r_ij*q_i
        end
    end
    return matrix


end

function householder!(matrix)

    

end
end