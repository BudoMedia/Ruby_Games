class Board

  attr_reader :board

  def initialize
    @board = Array.new(3) { Array.new(3," ") }
    # @board = [[1,2,3],[4,5,6],[7,8,9]]
    # @board = [["X","X","X"],[" ", " ", " "],[" ", " ", " "]]
    # @board = [["X"," "," "],["X", " ", " "],["X", " ", " "]]
    # @board = [["X"," "," "],[" ", "X", " "],[" ", " ", "X"]]
    # @board = [[" ", " ", "X"],[" ", "X", " "],["X"," "," "]]
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @board[x][y] = value
  end

  def render
    system('clear')

    puts "  #{(0...3).to_a.join("  ")}"

    temp = []
    @board.each_with_index do |row, idx|
      temp << (  "#{idx} #{row.join(" |")}" )
      temp << "  ---------" if idx < 2
    end

    temp.each { |row| puts row }
  end

end
