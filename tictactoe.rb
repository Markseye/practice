class TicTacToe

  def initialize
    @board = Array.new(9) {""}
  end

  def generate_board
    9.times do
      @board << " "
    end

    line_break = "---------"
    puts "Here's the board layout. Enter number location when picking a spot"
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "#{line_break}"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "#{line_break}"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  #get player info
  def get_player_names
    puts "Player 1! What is your name?"
    @p1_name = gets.chomp
    puts "Player 2! What is your name?"
    @p2_name = gets.chomp
    #randomly generate who goes first
    r = Random.new(1)
    first_turn(r)
  end

  def first_turn(r)
    r == 1 ? turns(1, "X") : turns(2, "O")
  end

  def turns(turn, player_sym)  
    if (turn % 2) == 0
      puts "#{@p2_name}'s Turn, #{player_sym}"
    else
      puts "#{@p1_name}'s Turn , #{player_sym}"
    end

    #here add method to then play turn, then at the end of that method run turns with turn +=1
  end

  def active_player
  end

end

z = TicTacToe.new
z.generate_board
z.get_player_names