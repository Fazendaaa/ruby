=begin
                        Special Pythagorean triplet

    A  Pythagorean  triplet  is  a  set of three natural numbers, a < b < c, for
    which,
                                a² + b² = c²

    For example, 3² + 4² = 9 + 16 = 25 = 5².
    There exists exactly one Pythagorean triplet for which a + b + c = 1000.
    Find the product abc.
=end

def special_pythagorean_triplet( number )
    a = b = c = 0
    flag = false

    for i in 1..number do
        for j in 1..i do
            for k in 1..j do
                if k*j + i*number == ( number**2 ) / 2 &&
                   k + j + i == number then
                    a, b, c = k, j, i
                    flag = true
                    break
                end
            end
            if flag then
                break
            end
        end
        if flag then
            break
        end
    end

    puts a, b, c
    return a, b, c
end

puts special_pythagorean_triplet( 1000 ).inject { | result, element | result = result * element }
