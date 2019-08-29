class Player
    attr_reader :character, :name

    def initialize(character,name)
        @character = character
        @name = name
    end

   end

class Board
  attr_accessor :current_state

  private
  def inner_win_check (column_count, i, player_character, winner)
    count = 0
    (0..2).each do |j|
      if  @current_state[i][j] == player_character
        count += 1
        column_count[j] +=1

        winner = true if count == 3 || column_count[j] == 3
      end
    end

    return winner
  end

  public
  def initialize
  @current_state = [["1,1","2,1","3,1"],["1,2","2,2","3,2"],["1,3","2,3","3,3"]]
  end

  def emptyCounter
    counter = 0
    @current_state.each do |x|
      x.each do |y|
        counter += 1 unless y == "X" || y == "O"
      end
    end

    return counter
  end

  def win_check(player_character)
    winner = false
    column_count = [0,0,0]
    diagonal_count_top = 0
    diagonal_count_bottom = 0

    (0..2).each do |i|
      winner = inner_win_check(column_count, i, player_character, winner)

      diagonal_count_top += 1 if @current_state[i][i] == player_character
      diagonal_count_bottom += 1 if @current_state[i][2-i] == player_character
      winner = true if diagonal_count_top == 3 || diagonal_count_bottom == 3
    end
    return winner
  end
end

class Game
attr_reader :current_player, :winner, :valid_move, :board

   def initialize
    @board = Board.new
    @current_player = true
    @winner = false
    @valid_move = true
    end

    def turn(current_move, player_character)
      if current_move.match('[1-3],[1-3]').nil?
        @valid_move = false
      else
        @valid_move = true
        current_move = current_move.split(",")
        x = current_move[1].to_i - 1
        y = current_move[0].to_i - 1
          if @board.current_state[x][y] != "X" && @board.current_state[x][y] != "O"
              @board.current_state[x][y] = player_character
              @valid_move = true
              @winner = @board.win_check(player_character)
              @current_player = !@current_player unless @winner
          else
              @valid_move = false
          end
        end
    end

    def show
    (0..2).each do |i|
    (0..2).each do |j|
        print @board.current_state[i][j]
        print "\t"
    end
    print "\n"
    end

    end
    end
