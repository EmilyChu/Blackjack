class Card
attr_reader :values 
	def initialize (values, suit)
		@values = values 
		@suit = suit
	end

	def value
		if [:J, :Q, :K].include?(@values)
			return 10
		elsif @values == :A
			return 1
		else 
			return @values 
		end
	end

	def to_s
    "#{@values}#{@suit}"
  end
end

class Deck
	attr_reader :cards, :drawn

	def initialize
		@cards
		create_deck
		@drawn = []
	end

	def create_deck
		@cards = []
		value_of_cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
		suits_of_cards = [:H, :D, :C, :S]

		suits_of_cards.each do |s|
			value_of_cards.each do |val|
				@cards<<(Card.new(val,s))
			end
		end
	end

	def drawn
		@drawn
	end

	def draw
		drawn_card = @cards.pop
		@drawn << drawn_card
		return drawn_card
	end
end

class Hand
	def initialize
		@cards = []
	end

	def add (*cards)
		@cards += cards
		return @cards
	end

	def value
		x = @cards.inject(0) { |sum,card| sum + card.value }
		if x <=11 && @cards.any? { |card| card.values == :A }
			x+10
		else
			x
		end
	end

	def busted?
		value > 21
	end

	def blackjack?
		value == 21
	end

	def to_s
		x = @cards.each { |card| card.to_s }
    x.join ", "
	end
end
	
# def initialize (x, suit)
	# 	@number = x
	# 	@suit = suit
	# 	@value
	# end

	# def value
	# 	card_hash = { :J => 10, :Q => 10, :K => 10, :A => 11}  
	# 	if (2..10).include?@number
	# 		value = @number.to_i
	# 	else
	# 		check_for = @number
	# 		value = card_hash[check_for]
	# 	end	
	# end

# types_of_cards.each do |type|
# spade = [Card.new(type, :S)]

# suits_of_cards.each do |suit| 
# deck =	Card.new(((types_of_cards.each {|x| x}),suit)) 
# card_deck << deck
# end 