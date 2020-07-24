require "byebug"

def matrix_addition_reloaded(*matrices)
    rowlength = matrices[0].length
    collength = matrices[0][0].length
    matrices.each do |ele|
        if ele.length != rowlength || ele[0].length != collength
            return nil
        end
    end

    matrix = Array.new(matrices[0].length) {Array.new(matrices[0][0].length, 0)}
    matrices.each do |ele|
        ele.each_with_index do |n, i|
            n.each_with_index do |num, j|
                 matrix[i][j] += num
            end 
        end
    end
    matrix
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil