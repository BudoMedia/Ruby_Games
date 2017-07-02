class Card

  VALUES = ("A".."Z").to_a

  attr_reader :value

  def initialize(value, visible = false)
    @value = value
    @visible = visible
  end

  def self.make(size = 4)
    values = VALUES

    temp = []
    i = 0
    while temp.length < (size ** 2)
      0..2.times { temp << values[i] }
      i += 1
    end

    deck = []
    temp.each { |value| deck << Card.new(value) }
    0..3.times { deck.shuffle! }
    deck
  end

  def change(str)
    @value = str
  end

  def show
    @visible = true
  end

  def hide
    @visible = false
  end

  def shown?
    @visible
  end

end
