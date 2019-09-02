require_relative '../lib/logic.rb'

  def create_player(character)
    puts "Enter player #{character} name"
    name_one = gets.chomp
    return Player.new(character,name_one)
  end

  def show (game)
    str = ""
  (0..2).each do |i|
  (0..2).each do |j|
      str = str +  game.board.current_state[i][j]
      str = str + "\t"
  end
  str = str + "\n"
  end
  return str
  end

  def start(player1, player2)
   game = Game.new
    puts show(game)
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

     puts show(game)
   end
   
   if game.board.win_check(current.character) 
    puts "#{current.name} is the victor!"
   else
    game.board.empty_counter == 0
    puts "Draw!"
     
   end
  end

   player1 = create_player("X")
   player2 = create_player("O")
   game = start(player1, player2)
   run_game(player1, player2, game)
