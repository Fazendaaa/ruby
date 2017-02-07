=begin
							Prime digit replacements

	By  replacing  the 1st digit of the 2-digit number *3, it turns out that six
	of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.

	By  replacing  the  3rd  and  4th  digits of 56**3 with the same digit, this
	5-digit  number  is  the  first  example  having  seven primes among the ten
	generated  numbers,  yielding the family: 56003, 56113, 56333, 56443, 56663,
	56773, and 56993. Consequently 56003, being the first member of this family,
	is the smallest prime with this property.

	Find  the smallest  prime  which,  by   replacing  part  of  the number (not
	necessarily  adjacent digits) with the same digit, is part of an eight prime
	value family.
=end

require_relative 'project_euler'

def smallest_prime_digits_replacements( min )
	n = 10
	matches = []
	hash = Hash.new( false )

	while matches.length < min do
		n += 1

		if is_prime( n ) then
			#puts n
			prime = n.to_s.split( '' ).map( &:to_i )
			length = prime.length
			
			# => adjacent digits
			for i in 0..prime.length-1 do
				for j in i..prime.length-1 do
					#print "i: ", i, " j: ", j, "\n"
					matches = []
					tmp = ( i..j ).map { | e | prime[ e ] }
					new_number = prime.clone

					for k in 0..9 do
						( i..j ).each do | e | new_number[ e ] =k end
						combination = new_number.join.to_i
						#print combination, " "
						if length == combination.to_s.length then
							# => problably  a  little  awkward  but since has is
							# => much faster then is_prime if hash[ combination]
							# => prove  to  be  true is_prime will not be called
							# => and  if  this  verification  could  be a voided
							# => there's  no  need to call is_prime for the same
							# => combination value only the first time
							if hash[ combination ] || is_prime( combination )
								matches.push( combination )
								hash[ combination ] = true
							end
						end
					end
					#print "\n"
					
					prime.each_with_index do | e, i | e = tmp[ i ] end
					break if matches.length == min
				end
				#puts
				break if matches.length == min
			end

			# => need to implement something to verify not-adjacent digits
		end
	end

	return matches
end

print smallest_prime_digits_replacements( 7 ),"\n"