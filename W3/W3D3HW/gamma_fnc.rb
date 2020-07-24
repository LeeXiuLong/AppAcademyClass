require "byebug"
def gamma_fnc(n, gamma = n)
    return nil if n <= 0
    return 1 if n == 1
    original = gamma
    if n == gamma
        return gamma_fnc(n-1, original)
    else
        n * gamma_fnc(n-1, original)
    end
end

  p gamma_fnc(0)  # => returns nil
  p gamma_fnc(1)  # => returns 1
  p gamma_fnc(4)  # => returns 6
  p gamma_fnc(8)  # => returns 5040