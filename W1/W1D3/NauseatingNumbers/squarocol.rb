def squarocol?(matrix)
	hash = {}
	matrix.each_with_index do |array, rowIdx|
		array.each_with_index do |ele, columnIdx|
			if hash.has_key?("row"+rowIdx.to_s)
				hash["row"+rowIdx.to_s] << ele
			else
				hash["row"+rowIdx.to_s] = [ele]
			end
			if hash.has_key?("column"+columnIdx.to_s)
				hash["column"+columnIdx.to_s] << ele
			else
                hash["column"+columnIdx.to_s] = [ele]
            end
        end
    end
    
    hash.each do |key, val|
        firstEl = val[0]
        val.each_with_index do |ele,i|
            return true if val.all? {|ele| ele == firstEl }
        end
    end
    false
end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false