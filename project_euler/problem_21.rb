=begin
                                Amicable numbers

    Let  d(n) be defined as the sum of proper divisors of n (numbers less than n
    which  divide  evenly into n). If d(a) = b and d(b) = a, where a ≠ b, then a
    and b are an amicable pair and each of a and b are called amicable numbers.

    For  example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
    55  and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
    71 and 142; so d(284) = 220.

    Evaluate the sum of all the amicable numbers under 10000.
=end

#!/usr/bin/ruby

def all_divisors( number )
    divisors = []

    for i in 1..Math.sqrt( number ).to_i do
        if 0 == number % i then
            if number/i == i then
                divisors.push( i )
            else
                divisors.push( i, number/i )
            end
        end
    end

    return divisors
end

def amicable_numbers( number )
    if 1 == number then
        return 0
    else
        divisors = all_divisors( number )
        divisors.sort!.pop
        return divisors.inject { | result, element | result = result + element }
    end
end

def amicable_numbers_sum( number )
    sum = 0

    for i in 1..number do
        other = amicable_numbers( i )
        sum = sum + i if i != other && amicable_numbers( other ) == i
    end

    return sum
end

puts amicable_numbers_sum( 10_000 )
