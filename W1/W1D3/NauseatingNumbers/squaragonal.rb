def squaragonal?(matrix)
    dimension = matrix.length
    top_left = matrix[0][0]
    top_right = matrix[0][dimension - 1]
    i = 0
    j = 0
    first_diag = true
    s_diag = true
    
    while j < dimension
        if matrix[i][j] != top_left
            first_diag = false
            break
        else
            i += 1
            j += 1
        end
    end
    i = 0
    j = dimension -1
    while j >= 0
        if matrix[i][j] != top_right
            s_diag = false
            break
        else
            i += 1
            j -= 1
        end
    end

    return first_diag || s_diag
end

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false