=begin
                    Common used functions
=end

def is_prime( number )
    return false if 2 > number
    for i in 2..Math.sqrt( number ) do
        return false if 0 == number % i
    end
    return true
end
