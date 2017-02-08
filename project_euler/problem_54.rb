=begin
								Poker hands

	In  the  card game poker, a hand consists of five cards and are ranked, from
	lowest to highest, in the following way:

		* High Card: Highest value card.
		* One Pair: Two cards of the same value.
		* Two Pairs: Two different pairs.
		* Three of a Kind: Three cards of the same value.
		* Straight: All cards are consecutive values.
		* Flush: All cards of the same suit.
		* Full House: Three of a kind and a pair.
		* Four of a Kind: Four cards of the same value.
		* Straight Flush: All cards are consecutive values of same suit.
		* Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
		
	The cards are valued in the order:
	2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

	If  two  players  have  the  same  ranked hands then the rank made up of the
	highest value wins; for example, a pair of eights beats a pair of fives (see
	example  1  below).  But  if two ranks tie, for example, both players have a
	pair  of queens, then highest cards in each hand are compared (see example 4
	below);  if  the highest cards tie then the next highest cards are compared,
	and so on.

	Consider the following five hands dealt to two players:

	Hand	 	Player 1	 		Player 2	 		Winner
	
	1	 	 5H 5C 6S 7S KD		 2C 3S 8S 8D TD		   Player 2
			  Pair of Fives 	 Pair of Eights
	
	2	 	 5D 8C 9S JS AC 	 2C 5C 7D 8S QH 	   Player 1
		    Highest card Ace   Highest card Queen

	3	 	2D 9C AS AH AC 		 3D 6D 7D TD QD 	   Player 2
			  Three Aces 	  Flush with Diamonds

	4	 	4D 6S 9H QH QC 		 3D 6D 7H QD QS 	   Player 1
			Pair of Queens 		 Pair of Queens
		  Highest card Nine    Highest card Seven

	5	 	2H 2D 4C 4D 4S	     3C 3D 3S 9S 9D 	   Player 1
			  Full House 		   Full House
		   With Three Fours     With Three Threes

	The  file,  problem_54.txt,  contains one-thousand random hands dealt to two
	players.  Each  line  of  the file contains ten cards (separated by a single
	space): the first five are Player 1's cards and the last five are Player 2's
	cards.  You  can  assume  that all hands are valid (no invalid characters or
	repeated  cards),  each  player's  hand is in no specific order, and in each
	hand there is a clear winner.

	How many hands does Player 1 win?

	Articles that helped me out:
		*	http://stackoverflow.com/a/13634446/7092954
		*	https://boardgamegeek.com/wiki/page/Standard_Deck_Playing_Card_Games&redirectedfrom=standard_deck_playing_card_game#
		*	http://stackoverflow.com/a/76046/7092954
		*	http://stackoverflow.com/a/17463812/7092954
=end

require_relative 'project_euler'

=begin
	S = Spades
	H = Hearts
	D = Diamonds
	C = Clubs
=end

def __card_value( card )
	number = card.split( '' )[ 0 ]

	if 'J' == number
		number = 11
	elsif 'Q' == number
		number = 12
	elsif 'K' == number
		number = 13
	elsif 'A' == number
		number = 14
	end

	return number
end

def card_value( card )
	number = card.split( '' )[ 0..-2 ].join.to_i
	number = __card_value( card ) if 0 == number

	return number
end

def card_suit( card )
	return card.split( '' )[ -1 ]
end

def check_pair( n, hand )
	return hand.find_all { | e | n == hand.count( e ) }.uniq
end

def is_high_card( hand )
	return hand.map { | e | card_value( card ) }.max
end

def is_one_pair( hand )
	return 1 == check_pair( 2, hand ).length ? true : false
end

def is_two_pair( hand )
	return 2 == check_pair( 2, hand ).length ? true : false
end

def is_three_of_a_kind( hand )
	return nil != hand.find { | e | 3 == hand.count( e ) } ? true : false
end

def is_straight( hand )
	cards = hand.map { | e | card_value( e ) }.sort
	return ( 0..cards.length-2 ).all? { | i | cards[ i+1 ] - 1 == cards[ i ] }
end
	
def is_flush( hand )
	return 1 == hand.map { | e | card_suit( e ) }.uniq.length ? true : false
end

=begin
	* Full House: Three of a kind and a pair.
	* Four of a Kind: Four cards of the same value.
	* Straight Flush: All cards are consecutive values of same suit.
	* Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
=end

def is_full_house( hand )
	return is_three_of_a_kind( hand ) && ( is_one_pair( hand ) || is_two_pair( hand ) )
end

def is_four_of_a_kind( hand )

end

def is_straight_flush( hand )

end

def is_royal_flush( hand )

end


def play_hand( hand )
	score = []
	high_car = is_high_card( hand )
	one_pair = is_one_pair( hand )
	two_pair = is_two_pair( hand )
	three_of_a_kind = is_three_of_a_kind( hand )
	straight = is_straight( hand )
	flush = is_flush( hand )
	full_house = is_full_house( hand )
	four_of_a_kind = is_four_of_a_kind( hand )
	straight_flush = is_straight_flush( hand )
	royal_flush = is_royal_flush( hand )


end

def compare_hands( hand_1, hand_2 )

end

def poker_hands( filename )
	game = []
	
	File.open( filename, "r" ) do | file |
		file.each_line do | line |
			player_1, player_2 = in_groups( 2, line.scan( /\w+/ ) )
			hand_1 = play_hand( player_1 )
			hand_2 = play_hand( player_2 )
			winner = compare_hands( hand_1, hand_2 )
			game.push( [ player_1, player_2, winner ] )
		end
	end

	return game
end

#print poker_hands( "problem_54.txt" ),"\n"
#print is_one_pair( [ "5H", "5H", "6S", "6S", "7S" ] ), "\n"
#print is_two_pair( [ "5H", "5H", "4S", "6S", "7S" ] ), "\n"
#print is_three_of_a_kind( [ "5H", "5H", "6S", "6S", "9S" ] ), "\n"
#print card_value( "QH" ), "\n"
#print is_straight( [ "1H", "2H", "8S", "4S", "7S" ] ), "\n"
#print is_flush( [ "1H", "2H", "8H", "4H", "7Q" ] ), "\n"
print is_full_house( [ "1H", "1H", "1H", "4H", "4Q" ] ), "\n"
