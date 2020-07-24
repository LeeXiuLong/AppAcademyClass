def ice_cream_shop(flavors, favorite)
    if flavors.length <= 1 && flavors.first != favorite
        return false
    else
        return true if flavors.first == favorite
        ice_cream_shop(flavors[1..-1], favorite)
    end
end

  p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
  p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
  p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
  p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
  p ice_cream_shop([], 'honey lavender')  # => returns false