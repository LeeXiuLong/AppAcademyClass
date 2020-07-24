require "byebug"
def reverse(string)
    return string if string.length <= 1
    string[-1] + reverse(string[0..-2])
end

p  reverse("house") # => "esuoh"
p  reverse("dog") # => "god"
p  reverse("atom") # => "mota"
p  reverse("q") # => "q"
p  reverse("id") # => "di"
p  reverse("") # => ""