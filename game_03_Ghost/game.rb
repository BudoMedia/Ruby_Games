# require_relative 'dictionary.txt'

class Game

  LETTERS = ("a".."z").to_a

  def initialize(player = "Player 1")
    @dictionary = lines
    @word = []
    @player = player
  end

  def play
    won = false
    until won
      guess = playerGuess
      switchPlayer
      next if (@word.join("") + guess).length <= 3
      won = won?
    end

    puts "#{@player} wins with #{@word.join("")}!"
  end

  def won?
    return true if @dictionary.include?(@word.join(""))
    false
  end

  def switchPlayer
    @player == "Player 1" ? @player = "Player 2" : @player = "Player 1"
  end

  def playerGuess
    pass = false
    until pass
      system('clear')

      puts "#{@player}"
      puts "Current word = \"#{@word.join("")}\""
      puts "Pick a letter"
      puts ">> "

      guess = gets.chomp.downcase
      next if guess.length != 1 || !LETTERS.include?(guess)
      pass = true
      @word << guess
    end
    guess
  end

  def lines
    temp = []
    arr = File.readlines('dictionary.txt')
    arr.each { |line| temp << line.chomp }
    temp
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
