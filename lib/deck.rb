class Deck
  SUITS = ['♠', '♣', '♥', '♦']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  def initialize
    @collection = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @collection << Card.new(rank, suit)
      end
    end

    @collection.shuffle!
  end

  def draw!
    @collection.pop
  end
end
