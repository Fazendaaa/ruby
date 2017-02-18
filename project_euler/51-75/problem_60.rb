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
		* See exercise 62
=end

require_relative '../project_euler'

def prime_pair_sets( min )
	hash = Hash.new

	set = catch( :END ) {
		n = 0
		while n = next_prime( n ) do
			hash[ n ] = [ n ]

			for k, v in hash do
				count = 0

				for i in v do
					pre = ( i.to_s.concat( n.to_s ) ).to_i
					pos = ( n.to_s.concat( i.to_s ) ).to_i

					if is_prime( pre ) && is_prime( pos )
						count += 1
					else
						break
					end
				end

				hash[ k ].push( n ) if hash[ k ].length == count

				throw :END, hash[ k ] if hash[ k ].length == min
			end
		end
	}

	return set
end

puts prime_pair_sets( 4 ).reduce( :+ )