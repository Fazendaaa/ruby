=begin
								Luhn Algorithm

	The  Luhn  algorithm  or  Luhn  formula,  also  known as the 'modulus 10' or
	'mod 10'  algorithm, is a simple checksum formula used to validate a variety
	of  identification  numbers,  such  as  credit  card  numbers, IMEI numbers,
	National  Provider  Identifier  numbers in the US, Canadian Social Insurance
	Numbers,  and  Greek  Social  Security Numbers (ΑΜΚΑ). It was created by IBM
	scientist  Hans Peter Luhn and described in U.S. Patent No. 2,950,048, filed
	on January 6, 1954, and granted on August 23, 1960.

	The  algorithm  is  in  the  public  domain  and is in wide use today. It is
	specified  in  ISO/IEC 7812-1.  It is not intended to be a cryptographically
	secure  hash function; it was designed to protect against accidental errors,
	not  malicious attacks. Most credit cards and many government identification
	numbers use the algorithm as a simple method of distinguishing valid numbers
	from mistyped or otherwise incorrect numbers.

	The formula verifies a number against its included check digit, which is
	usually appended to a partial account number to generate the full account
	number.

	Reference:
		*	https://fluxusfrequency.github.io/blog/2014/01/31/building-a-binary-search/
		*	https://en.wikipedia.org/wiki/Luhn_algorithm
		*	http://stackoverflow.com/a/16232466/7092954
=end

def luhn_checksum( card_number )
	digits = card_number.split( '' ).map { | e | e.to_i }
	odd_digits = digits.values_at( *( 0..digits.length-1 ).step( 2 ) )
	even_digits = digits.values_at( *( 1..digits.length-1 ).step( 2 ) )
	sum = odd_digits.reduce( :+ )
	sum += even_digits.map{ | e |
		  ( 2*e ).to_s.split( '' ).map( &:to_i ).reduce( :+ ) }.reduce( :+ )
	return sum % 10
end

def is_luhn( card_number )
	return 0 == luhn_checksum( card_number )
end

def calculate_luhn( partial_card_number )
	check_digit = luhn_checksum( ( partial_card_number.to_i * 10 ).to_s )
	return 0 == check_digit ? 0 : 10 - check_digit
end

test_cards = [ "79927398710", "79927398711", "79927398712", "79927398713", "79927398714",
			   "79927398715", "79927398716", "79927398717", "79927398718", "79927398719" ]

puts test_cards.select { | e | is_luhn( e ) }
puts calculate_luhn( "7992739871" )