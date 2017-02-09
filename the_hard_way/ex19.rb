def cheese_and_crackers( cheese_count, boxes_of_crackers )
    puts "You have #{ cheese_count } cheeses!"
    puts "You have #{ boxes_of_crackers } boxes of crackers!"
    puts "Man that's enough for a party!"
    puts "Get a blacnket.\n"
end

puts "We can just give the function numbers direclty:"
cheese_and_crackers( 20, 30 )

puts "Or, we can use variables from our script:"
cheese_and_crackers( amount_of_cheese = 10, amount_of_crackers = 50 )

puts "We can even do math inside:"
cheese_and_crackers( 10 + 20, 5 + 6 )

puts "We can get from the user too:"
cheese_and_crackers( $stdin.gets.chomp.to_i, $stdin.gets.chomp.to_i )

puts "And we can combine the two, variables and math:"
cheese_and_crackers( amount_of_cheese + 100, amount_of_crackers + 1000 )
