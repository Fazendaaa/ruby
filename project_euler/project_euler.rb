=begin
                            Common used functions
=end

def is_prime( number )
    return false if 2 > number

    for i in 2..Math.sqrt( number ) do
        return false if 0 == number % i
    end

    return true
end

def erastosthenes_sieve( limit )
    # => in case limit is a prime there's need to add one to count limit as prime
    limit = limit + 1
    numbers = Array.new( limit ) { | i | true }
    numbers[ 0 ] = numbers[ 1 ] =  false

    for i in 2..Math.sqrt( limit ).to_i do
        (i**2..limit).step(i) do | j | numbers[ j ] = false end if numbers[ i ]
    end

    return numbers.each_index.select { | i | numbers[ i ] }
end

def all_divisors( number )
    divisors = []

    return [ 0 ] if 0 > number

    for i in 1..Math.sqrt( number ).to_i do
        if 0 == number % i then
            divisors.push( i )
            divisors.push( number/i ) if number/i != i
        end
    end

    return divisors.sort
end

def prime_factors( n )
    factors = []
    
    check = proc do | p |
        while( q, r = n.divmod( p )
               r.zero? )
            factors.push( p )
            n = q
        end
    end

    check[ 2 ]
    check[ 3 ]
    
    p = 5
    
    while p * p <= n
        check[ p ]
        p += 2
        check[ p ]
        p += 4
    end
    
    factors.push( n ) if n > 1
    
    return factors
end

def in_groups( n, arrray )
  return [] if 0 > n
  
  slice_size = ( arrray.length / Float( n ) ).ceil
  return arrray.each_slice( slice_size ).to_a
end

def is_palindromic( string )
    return string == string.reverse
end

def next_prime( number )
    return 2 if 2 > number

    n = ( 0 != ( number + 1 ) % 2 ) ? number + 1 : number + 2

    while !is_prime( n ) do
        n += 2
    end

    return n
end