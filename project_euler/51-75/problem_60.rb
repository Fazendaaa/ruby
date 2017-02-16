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
		*	http://rubylearning.com/blog/2013/06/19/how-do-i-benchmark-ruby-code/
		*	http://www.mathblog.dk/project-euler-60-primes-concatenate/
=end

require_relative '../project_euler'

def make_pair( primes )
	hash = Hash.new( false )
	combination = primes.combination( 2 ).to_a.select { | e | is_prime( e ) }
	combination.each do | e | hash[ e ] = true end 

	return hash
end

def prime_pair_sets( min )
	hash = make_pair( erathotenes_sieve( 30_000 ) )


	return set
end

puts prime_pair_sets( 5 ).reduce( :+ )
