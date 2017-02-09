=begin
                            Largest prime factor

    The prime factors of 13195 are 5, 7, 13 and 29.
    What is the largest prime factor of the number 600851475143 ?
=end

def largest_prime( max )
    largest = 0, i = 2

    while 1 != max do
        if 0 == max % i then
            while 0 == max % i do
                max /= i;
            end
            largest = i
        end
        i += 1
    end

    return largest
end

puts largest_prime( 600851475143 );
