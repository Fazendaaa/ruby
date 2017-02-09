=begin
                            Factorial digit sum

    n! means n × (n − 1) × ... × 3 × 2 × 1

    For  example,  10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,  and the sum of the
    digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

    Find the sum of the digits in the number 100!
=end

def factorial_digit_sum( limit )
    result = 1

    # => could start at two, but when the 'limit' is two wouldn't work
    for i in 1..limit do
        result = result * i
    end

    result = result.to_s.split( // ).map( &:to_i ).
             inject { | result, element | result = result + element }

    return result
end

puts factorial_digit_sum( 100 )
