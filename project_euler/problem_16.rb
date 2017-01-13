=begin
                                Power digit sum

    2¹ = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

    What is the sum of the digits of the number 21000?
=end

def power_digit_sum( base, power )
    return ( base**power ).to_s.split(//).map( &:to_i ).
           inject { | result, element | result = result + element }
end

puts power_digit_sum( 2, 1_000 )
