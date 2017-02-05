=begin
							Pentagon numbers

	Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. The first ten
	pentagonal numbers are:

				1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

	It  can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference,
	70 − 22 = 48, is not pentagonal.

	Find  the  pair  of  pentagonal  numbers, Pj and Pk, for which their sum and
	difference  are pentagonal and D = |Pk − Pj| is minimised; what is the value
	of D?

	Articles that helped me out:
		* 	www.mathblog.dk/project-euler-44-smallest-pair-pentagonal-numbers/
=end

def is_pentagon( number )
	test = ( Math.sqrt( 1 + 24*number ) + 1.0 )/ 6.0
	return test.to_i == test
end

def pentagon_numbers_abs
	flag = true
	n = 1

	while flag do
		n += 1			
		k = n * ( 3*n -1 ) / 2
		
		for m in ( n-1 ).downto( 1 ) do
			j = m * ( 3*m -1 ) / 2
			
			if is_pentagon( k - j ) && is_pentagon( k + j ) then
				d = [ k, j ]
				flag = false
				break
			end
		end
	end

	return d
end

puts pentagon_numbers_abs.inject { | diff, var | diff -= var }.abs