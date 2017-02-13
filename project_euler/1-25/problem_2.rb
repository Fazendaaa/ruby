=begin
							Even Fibonacci numbers

	Each  new term in the Fibonacci sequence is generated by adding the previous
	two terms. By starting with 1 and 2, the first 10 terms will be:

					1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

	By  considering  the  terms  in  the  Fibonacci sequence whose values do not
	exceed four million, find the sum of the even-valued terms.

								Answer: 4613732
=end

def even_fibonacci_numbers( limit )
	fibonacci = [ 1 ]
	prox = 2

	while prox < limit do
		fibonacci.push( prox )
		prox += fibonacci[ -2 ]
	end

	return fibonacci.select { | e | 0 == e % 2 }
end

puts even_fibonacci_numbers( 4_000_000 ).reduce( :+ )