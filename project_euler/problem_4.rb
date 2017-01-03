=begin
                            Largest palindrome product

    A  palindromic  number reads the same both ways. The largest palindrome made
    from the product of two 2-digit numbers is 9009 = 91 × 99.
    Find the largest palindrome made from the product of two 3-digit numbers.
=end

def largest_palindrome_product
    last = 0

    for x in 100..999 do
        for y in 100..999 do
            if ( x*y ).to_s == (( x*y ).to_s ).reverse! && last < x*y then
                last = x*y
            end
        end
    end

    return last
end

puts largest_palindrome_product( )
