=begin
                                Non-abundant sums

    A  perfect  number  is  a number for which the sum of its proper divisors is
    exactly  equal to the number. For example, the sum of the proper divisors of
    28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

    A  number  n  is  called deficient if the sum of its proper divisors is less
    than n and it is called abundant if this sum exceeds n.

    As  12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
    number  that  can  be  written  as the sum of two abundant numbers is 24. By
    mathematical  analysis, it can be shown that all integers greater than 28123
    can be written as the sum of two abundant numbers. However, this upper limit
    cannot  be  reduced any further by analysis even though it is known that the
    greatest  number that cannot be expressed as the sum of two abundant numbers
    is less than this limit.

    Find the sum of all the positive integers which cannot be written as the sum
    of two abundant numbers.
=end

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

    return divisors.sort!
end

def non_abundant_numbers
    sum = 0
    abundant = []
    result = []

    for i in 1..28_123 do
        divisors = all_divisors( i )
        divisors.pop
        sum = divisors.inject { | result, element | result += element }
        sum = 0 if nil == sum
        abundant.push( i ) if i < sum
    end

    for i in abundant do
        for j in abundant do
            sum = i + j
            if sum > 28_123 then
                break
            else
                result.push( sum )
            end
        end
    end

    return ( 1..28_123 ).to_a - result
end

puts non_abundant_numbers.
     inject { | result, element | result = result + element }
