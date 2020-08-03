# class Integer
#   # Integer#hash already implemented for you
# end
 
# class Array
#   def hash
#     final = 0
#     alpha = (1..26).to_a
    
#     self.each_with_index do |num, i| 
#       if i % 2 == 0
#         final += alpha[num % 26]
#       else
#         final -= alpha[num % 26]
#       end
#     end
#     final
#   end
# end

# class String
#   def hash
#     final = 0
#     alpha = ("a".."z").to_a
    
#     self.each_char.with_index do |ele, i| 
#       if i % 2 == 0
#         final += alpha.index(ele.downcase)
#       else
#         final *= alpha.index(ele.downcase)
#       end
#     end
#     final
#   end
# end

# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     0
#   end
# end
