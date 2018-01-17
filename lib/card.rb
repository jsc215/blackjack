
class Card
  attr_reader :rank

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def name
    "#{@rank}#{@suit}"
  end

  def face_card?
    ['J', 'Q', 'K'].include?(@rank)
  end

  def ace?
    @rank == 'A'
  end
end
