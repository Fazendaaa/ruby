=begin
                                Quadratic primes

    Euler discovered the remarkable quadratic formula:

                                n² + n + 41

    It  turns  out  that  the formula will produce 40 primes for the consecutive
    integer   values   0≤n≤39.   However,  when n=40,  40²+40+41=40(40+1)+41  is
    divisible  by 41, and certainly when n=41, 41²+41+41 is clearly divisible by
    41.

    The  incredible formula n²−79n+1601 was discovered, which produces 80 primes
    for  the consecutive values 0≤n≤79. The product of the coefficients, −79 and
    1601, is −126479.

    Considering quadratics of the form:

            n²+an+b, where |a|<1000 and |b|≤1000

            where |n| is the modulus/absolute value of n
            e.g. |11|=11 and |−4|=4

    Find   the  product  of  the  coefficients,  a  and  b,  for  the  quadratic
    expression that produces the maximum number of primes for consecutive values
    of n, starting with n=0.
=end

def all_divisors( number )
    divisors = []

    return [ 0 ] if 0 > number

    for i in 1..Math.sqrt( number ).to_i do
        if 0 == number % i then
            divisors.push( i )
            divisors.push( number/i ) if number/i != i
        end
    end

    return divisors
end

def quadratic_primes( mod_a, mod_b )
    max_coef = max_a = max_b = 0

    mod_a.downto( -mod_a ) do | a |
        mod_b.downto( -mod_b ) do | b |
            n = 0
            while 2 == all_divisors( n**2 + a*n + b ).length
                n += 1
            end
            max_coef, max_a, max_b = n, a, b if n > max_coef
        end
    end

    return max_a, max_b
end

puts quadratic_primes( 1_000, 1_000 ).
     inject { | result, element | result *= element }
