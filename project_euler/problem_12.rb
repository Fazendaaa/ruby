=begin
                        Highly divisible triangular number

    The sequence of triangle numbers is generated by adding the natural numbers.
    So  the  7th  triangle  number  would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The
    first ten terms would be:

                    1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

    Let us list the factors of the first seven triangle numbers:

                                 1: 1
                                 3: 1,3
                                 6: 1,2,3,6
                                10: 1,2,5,10
                                15: 1,3,5,15
                                21: 1,3,7,21
                                28: 1,2,4,7,14,28

    We can see that 28 is the first triangle number to have over five divisors.
    What  is  the  value  of the first triangle number to have over five hundred
    divisors?

    note: for more read -- http://www.mathsisfun.com/algebra/triangular-numbers.html
=end

#!/usr/bin/ruby

def number_of_divisors( num )
    divisors = []

    for i in 1..Math.sqrt( num ).to_i do
        if 0 == num % i then
            if num/i == i then
                divisors.push( i )
            else
                divisors.push( i, num/i )
            end
        end
    end

    return divisors.length
end

def highly_divisible_tirangular( min )
    triangular_numbers = [ ]
    flag = true
    i = 1
    divisors = 0

    while flag do
        triangular_numbers.push( ( 1..i ).reduce( 0, :+ ) )
        divisors = number_of_divisors( triangular_numbers[ i - 1 ] )
        i = i + 1

        if divisors >= min then
            flag = false
        end
    end

    return triangular_numbers[ i - 2 ]
end

puts highly_divisible_tirangular( 500 )