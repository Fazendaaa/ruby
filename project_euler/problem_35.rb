=begin
                                Circular primes

    The  number,  197,  is  called a circular prime because all rotations of the
    digits: 197, 971, and 719, are themselves prime.

    There  are  thirteen  such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37,
    71, 73, 79, and 97.

    How many circular primes are there below one million?
=end

def sieve( limit )
    numbers = Array.new( limit ) { | i | true }
    numbers[ 0 ] = numbers[ 1 ] =  false

    for i in 2..Math.sqrt( limit ).to_i do
        ( i**2..limit ).step( i ) do | j |
            numbers[ j ] = false
        end if numbers[ i ]
    end

    return numbers.each_index.select { | i | numbers[ i ] }
end

def all_divisors( number )
    divisors = []

    for i in 1..Math.sqrt( number ).to_i do
        if 0 == number % i then
            divisors.push( i )
            divisors.push( number/i ) if number/i != i
        end
    end

    return divisors
end

def circular_primes( limit )
    primes = sieve( limit )
    circular_primes = primes[ 0..3 ]

    for prime in primes do
        tmp = []
        for new_number in prime.to_s.split( // ).permutation do
            new_number = new_number.join.to_i
            tmp.push( new_number ) if 2 == all_divisors( new_number ).length
        end
        circular_primes.push( new_number ) if tmp.length > 1
    end

    return circular_primes.flatten
end

puts circular_primes( 1_000_000 ).length
