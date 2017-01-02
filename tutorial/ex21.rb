def add( a, b )
    puts "Adding: #{ a } + #{ b }"
    return a + b
end

def sub( a, b )
    puts "Subtracting: #{ a } - #{ b }"
    return a - b
end

def mul( a, b )
    puts "Multiplying: #{ a } * #{ b }"
    return a * b
end

def div( a, b )
    puts "Dividing: #{ a } / #{ b }"
    return a / b
end

puts "Let's do some math with just functions!"

age = add( 30, 5 )
height = sub( 78, 4 )
weight = mul( 90, 2 )
iq = div( 100, 2 )

puts "Age: #{ age }, Height: #{ height }, Weight: #{ weight }, IQ: #{ iq }"

puts "Here is a puzzle."

what = add( age, sub( height, mul( weight, div( iq, 2 ) ) ) )

puts "That becomes: #{ what }. Can you do it by hand?"
