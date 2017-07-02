require_relative 'card.rb'

class Board

  attr_reader :board

  def initialize(size = 4)
    @board = Card.make(size).each_slice(size).to_a
    @size = size
  end

  def render
    system('clear')

    puts "  #{(0...@size).to_a.join(" ")}"

    @board.each_with_index do |row, idx|
      arr = []
      row.each do |el|
        # arr << el.value
        el.shown? ? arr << el.value : arr << "*"
      end
      puts "#{idx} #{arr.join(" ")}"
    end
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @board[x][y] = value
  end

end
