class Player

   attr_reader :player, :players

   def initialize(player = "player1")
     @players = {
       "player1" => "X",
       "player2" => "Y"
     }
     @player = player
   end

   def switch
     @player == "player1" ? @player = "player2" : @player = "player1"
   end

end
