require_relative 'board.rb'

class Game

  # attr_reader :guesses, :board, :value

  def initialize(size = 4)
    @board = Board.new
    @previous_guess = nil
    @size = size
    @guesses = []
    @count = 0
  end

  def play
    until won?
      guess1 = get_guess
      @board[guess1].show
      @previous_guess = guess1
      guess2 = get_guess
      @board[guess2].show
      @previous_guess = nil
      @board.render

      sleep(2)
      arr = [guess1, guess2]
      if @board[guess1].value == @board[guess2].value
        arr.each { |el| @guesses << el }
        arr.each { |el| @board[el].change(" ") }
      else
        arr.each { |el| @board[el].hide }
      end
      @count += 1
    end
    @board.render
    puts "It took you #{@count} guesses to win!"
  end

  def won?
    @guesses.length == (@size ** 2)
  end

  def get_guess
    pass = false
    until pass
      @board.render
      puts ">> "
      guess = gets.chomp
      next if !test1(guess)
      # puts "Pass test 1"

      guess = clean(guess)
        p guess
      next if guess == false
        # puts "Passes clean"
      next if @previous_guess == guess
        # puts "Passes previous"
      next if @guesses.include?(guess)
        # puts "Passes lookup"
      pass = true
    end
    guess
  end

  def clean(guess)
    x, y = guess.split(",")

    return false if x == "" || y == ""
      # puts "Passes blank"
    return false if x.nil? || y.nil?
      # puts "Passes nil"

    x = x.to_i
    y = y.to_i
    arr = [x, y]
      # p arr
    arr.each { |el| return false if !(0...@size).to_a.include?(el) }
      # puts "Passes range"
    arr
  end

  def test1(guess)
    arr = [
      guess.is_a?(String),
      guess.include?(","),
      guess.length == 3
    ]
    arr.all?
  end

end

game = Game.new
game.play
