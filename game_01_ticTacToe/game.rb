require_relative 'board.rb'
require_relative 'player.rb'

class Game

  attr_reader :board, :player

  def initialize
    @board = Board.new
    @player = Player.new
    @previous_moves = []
  end

  def play
    until won?
      move = user_move
      @board[move] = @player.players[player.player]
      @player.switch
    end

    @player.switch
    @board.render
    puts
    puts "Player #{@player.player.slice(6)} wins with #{@player.players[player.player]}!"
    puts
  end

  def user_move
    pass = false
    until pass
      @board.render
      puts "#{@player.player}"
      puts ">> "
      move = gets.chomp
      next if !check_move(move)

      move = clean_move(move)
      next if move == false
      next if @previous_moves.include?(move)

      pass = true
      @previous_moves << move
    end
    move
  end

  def clean_move(move)
    x, y = move.split(",")
    return false if x == "" || y == ""
    return false if x.nil? || y.nil?

    x = x.to_i
    y = y.to_i
    arr = [x, y]
    arr.each { |el| return false if !(0...3).to_a.include?(el) }
    arr
  end

  def check_move(move)
    arr = [
      move.is_a?(String),
      move.include?(","),
      move.length == 3
    ]
    arr.all?
  end

  def won?
    arr = [
      row?,
      col?,
      diag?
    ]
    arr.any?
  end

  def row?
    @board.board.each { |row| return true if row.uniq == ["X"] || row.uniq == ["Y"] }
    false
  end

  def col?
    col = Array.new(3) { Array.new(3) }
    i = 0
    @board.board.each do |row|
      row.each_with_index { |el, idx| col[idx][i] = el }
      i += 1
    end
    col.each { |row| return true if row.uniq == ["X"] || row.uniq == ["Y"] }
    false
  end

  def diag?
    arr1 = []
    arr2 = []

    @board.board.each_with_index do |row, idx|
      arr1 << row[idx]
      arr2 << row[-1 - idx]
    end

    return true if arr1.uniq == ["X"] || arr1.uniq == ["Y"]
    return true if arr2.uniq == ["X"] || arr2.uniq == ["Y"]
    false
  end

end

game = Game.new
game.play
