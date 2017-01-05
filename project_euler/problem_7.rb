=begin
                                10001st prime

    By  listing  the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
    that the 6th prime is 13.
    What is the 10 001st prime number?

    note:
    "An  array with 500 million elements is 2 GiBytes in size, which – depending
    on  the  specific OS you are using – is typically the maximum that a process
    can address. In other words: your array is bigger than your address space."
    from: http://stackoverflow.com/questions/3687517/array-size-too-big-ruby/3688388#3688388
=end

def sieve( limit )
    flag = true
    counter = 0
    primes = [ 2 ]

    while flag do
        last = primes.length-1
        puts last
        max = primes[ last ]
        #puts max
        for i in ( 2..max ) do
            ( i+i..max ).step( i ) do | j |
                primes[ j ] = false
            end
        end

        total_primes = primes.inject { | result, element | ( false != element ) ? result + 1 : result + 0 }
        new_primes = total_primes - counter
        counter = counter + new_primes

        #puts counter

        if limit == counter then
            flag = false
        end
    end

    return primes.pop
end

sieve( 10_001 )
