=begin
                        Longest Collatz sequence

    The  following  iterative  sequence  is  defined  for  the  set  of positive
    integers:

                            n → n/2 (n is even)
                            n → 3n + 1 (n is odd)

    Using  the  rule  above  and  starting  with  13,  we generate the following
    sequence:

                13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

    It  can  be  seen  that  this  sequence  (starting at 13 and finishing at 1)
    contains 10 terms. Although it has not been proved yet (Collatz Problem), it
    is thought that all starting numbers finish at 1.
    Which starting number, under one million, produces the longest chain?
    NOTE: Once the chain starts the terms are allowed to go above one million.
=end

def collatz_sequence( seed )
    sequence = [ ]
    n = seed

    while 1 != n
        sequence.push( n )
        n = ( 0 == n % 2 ) ? n/2 : 3*n + 1
    end

    return sequence
end

def longest_collatz_sequence( limit )
    longest = 0

    for i in 1..limit do
        size = collatz_sequence( i ).length

        if size > longest then
            longest = size
            index = i
        end
    end

    return index
end
limit = 1_000_000
#puts ( 1..limit ).each { | i | collatz_sequence( i ) }.max
puts longest_collatz_sequence( limit )
