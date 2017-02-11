=begin
								Prime pair sets

	The  primes  3,  7,  109,  and  673, are quite remarkable. By taking any two
	primes  and concatenating them in any order the result will always be prime.
	For  example,  taking  7  and  109, both 7109 and 1097 are prime. The sum of
	these  four  primes, 792, represents the lowest sum for a set of four primes
	with this property.

	Find  the  lowest  sum  for  a  set  of five primes for which any two primes
	concatenate to produce another prime.

	Helped me out:
		*	http://www.mathplanet.com/education/algebra-2/discrete-mathematics-and-probability/permutations-and-combinations
=end

require_relative '../project_euler'

def prime_pair_sets( min )
	hash = Hash.new( false )
	primes = []
	matches = 0
	prime = 0
	# => P ( n , r ) = n ! ( n − r ) !
	n_permutation = ( 1..min ).reduce( :* ) / ( 1..min-2 ).reduce( :* )
	pair = nil

	while matches < n_permutation do
		prime = next_prime( prime )
		primes.push( prime )

		for a in primes.permutation( min ) do
			matches = 0

			for b in a.permutation( 2 ) do
				new_number = b.join.to_i
		
				if hash[ new_number ] || is_prime( new_number ) then
					hash[ new_number ] = new_number
					matches += 1
				# => all numbers must be primes
				else
					break
				end
			end


			if matches == n_permutation then
				pair = a
				break
			end
		end
	end

	return pair
end

puts prime_pair_sets( 4 )
