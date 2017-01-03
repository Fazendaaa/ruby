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
