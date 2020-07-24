def matrix_addition(mtx1, mtx2)
    matrix = Array.new(mtx1.length) {Array.new(mtx1[0].length)}
    mtx1.each_with_index do |ele, i|
        ele.each_with_index do |num, j|
           matrix[i][j] = mtx1[i][j] + mtx2[i][j]
        end
    end
    matrix
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0],[0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]