=begin
                            Smallest multiple

    2520  is the smallest number that can be divided by each of the numbers from
    1 to 10 without any remainder.
    What  is the smallest positive number that is evenly divisible by all of the
    numbers from 1 to 20?

    resolution source: http://www.mathblog.dk/project-euler-problem-5/
=end
#!/usr/bin/ruby

def generate_primes( limit )
    primes = [ 2 ]

    ( 3..limit ).step( 2 ) do | i |
        j = 0
        isPrime = true

        while primes[ j ] * primes[ j ] <= i
            if 0 == i % primes[ j ]
                isPrime = false
                break
            end
            j += 1
        end

        if isPrime
            primes.push( i )
        end
    end

    return primes
end

def smallest_multiple( limit )
    limit_log = Math::log10( limit )
    p = generate_primes( limit )
    result = 1

    for i in 0..p.length-1
        a = ( ( limit_log / Math::log10( p[ i ] ) ).floor ).to_i
        result = result * ( p[ i ] ** a )
    end

    return result
end

puts smallest_multiple( 20 )
