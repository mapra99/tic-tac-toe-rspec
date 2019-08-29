load '../lib/logic.rb'

  def create_player(character)
    puts "Enter player #{character} name"
    name_one = gets.chomp
    return Player.new(character,name_one)
  end

  def start(player1, player2)
   game = Game.new
   game.show
   puts "#{player1.name} VS #{player2.name}"
   return game
  end

  def run_game(player1, player2, game)
   until game.winner || game.board.empty_counter == 0 do
     current = game.current_player ? player1 : player2
     puts "Make a move #{current.name}"
           current_move = gets.chomp
           game.turn(current_move, current.character)
           puts "Please make a valid move" unless game.valid_move

     game.show
   end

   if game.board.empty_counter == 0
     puts "Draw!"
   else
     winner = game.current_player ? player1 : player2
     puts "#{winner.name} is the victor!"
   end
  end

   player1 = create_player("X")
   player2 = create_player("O")
   game = start(player1, player2)
   run_game(player1, player2, game)
