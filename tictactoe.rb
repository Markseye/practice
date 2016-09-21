class TicTacToe

  def initialize
    @board = Array.new(9) {""}
  end

  def generate_board
    puts "Here's the board layout. Enter number location when picking a spot"
    #@board.each_with_index do |box_value, i|
    line_break = "-----------------"
    pipe_break = "  |  "
    # if i % 3 != 0
    #   p "#{box_value} #{pipe_break}"
    #  else
    #    puts "#{box_value}"
    #    p "#{line_break}"
    #  end
    #end
    #if board % 3 !=0 board[i] + pipe_break for i+1 through 9 else /n and line break
    #puts "Here's the board layout. Enter number location when picking a spot"
    puts "#{@board[0]} #{pipe_break} #{@board[1]} #{pipe_break} #{@board[2]}"
    puts "#{line_break}"
    puts "#{@board[3]} #{pipe_break} #{@board[4]} #{pipe_break} #{@board[5]}"
    puts "#{line_break}"
    puts "#{@board[6]} #{pipe_break} #{@board[7]} #{pipe_break} #{@board[8]}"
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
    make_move(player_sym)
    #here add method to then play turn, then at the end of that method run turns with turn +=1
  end

  def make_move(player_sym)
    generate_board
    puts "Which number would location would you like?"
    box_chosen = gets.chomp.to_i
    check_box_avail(box_chosen,player_sym)
  end

  def check_box_avail(box_chosen, player_sym)
    if @board[box_chosen].empty?
      @board[box_chosen-1] = player_sym
      switch_player(player_sym)
    else
      puts "That box is taken already."
      generate_board
      puts "Chose an empty box"
      new_choice = gets.chomp.to_i
      check_box_avail(new_choice)
    end
  end

  def switch_player(player_sym)
    #full_board
    player_sym == "X" ? player_sym = "O" : player_sym = "X"
    make_move(player_sym)
  end

  def full_board
  end

end

z = TicTacToe.new
z.generate_board
z.get_player_names