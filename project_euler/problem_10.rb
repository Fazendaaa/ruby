=begin
                        Summation of primes

    The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
    Find the sum of all the primes below two million.
=end

def erastosthenes_sieve( limit )
    numbers = Array.new( limit ) { | i | true }
    numbers[ 0 ] = false
    numbers[ 1 ] = false
    max = ( Math.sqrt( limit ) ).to_i

    for i in 2..max do
        if numbers[ i ] then
            ( i**2..limit ).step( i ) do | j |
                numbers[ j ] = false
            end
        end
    end

    return numbers.each_index.select { | i | true == numbers[ i ] }
end

puts erastosthenes_sieve( 2_000_000 ).inject { | result, element | result = result + element }
