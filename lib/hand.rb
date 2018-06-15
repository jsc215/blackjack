class Hand
  attr_reader :score

  def initialize
    @cards = []
    @score = 0
  end

  def add(card)
    @cards << card
    @score = update_score
  end

  def update_score
    aces = []
    new_score = @cards.inject(0) do |score, card|
      if card.ace?
        aces << card
      elsif card.face_card?
        score += 10
      else
        score += card.rank
      end
    score
  end

    aces.count.times do
      aces.pop
        if (new_score + 11 + aces.count) > 21
        new_score += 1
        else
        new_score += 11
        end
      end
    new_score
  end
end
