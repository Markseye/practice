class TicTacToe

  PLAYER1_SYM = "X"
  PLAYER2_SYM = "O"

  def initialize
    @board = Array.new(9) {""}
    banner
    generate_board
    get_player_names
  end

  def banner
  puts %q[                              
    _______                              ____
   |__   __|    ____  _      ____  ___  ||
      | |  * //  ||  /_\  //  ||  // \\\\ ||--- 
      | | || \\\\  || || || \\\\  ||  \\\\_// ||___
  
      _______________________________________
  ]
  puts "Let's play"
  end  

  def generate_board
    puts "Here's the board layout. Enter number location when picking a spot"
    #@board.each_with_index do |box_value, i|
    line_break = "---------------"
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
    puts ""
    puts "#{@board[0]} #{pipe_break} #{@board[1]} #{pipe_break} #{@board[2]}"
    puts "#{line_break}"
    puts "#{@board[3]} #{pipe_break} #{@board[4]} #{pipe_break} #{@board[5]}"
    puts "#{line_break}"
    puts "#{@board[6]} #{pipe_break} #{@board[7]} #{pipe_break} #{@board[8]}"
    puts ""
  end

  #get player info
  def get_player_names
    puts "Player 1! What is your name?"
    @p1_name = gets.chomp
    puts "Player 2! What is your name?"
    @p2_name = gets.chomp
    #randomly generate who goes first
    r = Random.new
    r = r.rand(2)
    first_turn(r)
  end

  #randomize who gets first turn
  def first_turn(rand_num)
    rand_num == 1 ? turns(1, PLAYER1_SYM) : turns(2, PLAYER2_SYM)
  end

  def turns(turn, player_sym)  
    if (turn % 2) == 0
      puts "#{@p2_name}'s Turn"
    else
      puts "#{@p1_name}'s Turn"
    end
    puts "Your symbol is #{player_sym}"
    make_move(player_sym)
    #here add method to then play turn, then at the end of that method run turns with turn +=1
  end

  #player chooses move
  def make_move(player_sym)
    generate_board
    puts "Which number would location would you like?"
    box_chosen = gets.chomp.to_i
    check_box_avail(box_chosen,player_sym)
  end

  #check if box is already taken and store move. then check for winner..should this be broken out?
  def check_box_avail(box_chosen, player_sym)
    array_box = box_chosen - 1
    check_box_chosen(array_box, player_sym)
    if @board[array_box].empty?
      @board[array_box] = player_sym
      check_for_winner
      switch_player(player_sym)
    else
      puts "That box is taken already."
      generate_board
      puts "Chose an empty box"
      new_choice = gets.chomp.to_i
      check_box_avail(new_choice, player_sym)
    end
  end

  def check_box_chosen(box_chosen, player_sym)
    raise IndexError if box_chosen.to_i >= @board.size
    rescue IndexError
    puts "That's not 1 through 9! Guess Again"
    box_chosen = gets.chomp.to_i #use this a few times..make method for this?
    check_box_avail(box_chosen, player_sym)
  end

  #switch player after turn
  def switch_player(player_sym)
    check_full_board
    player_sym == PLAYER1_SYM ? player_sym = PLAYER2_SYM : player_sym = PLAYER1_SYM
    make_move(player_sym)
  end

  #check if board is full
  def check_full_board
    if @board.include? ""
      puts "back to player switch"
    else
      check_for_winner
    end
  end

#can this just be called in one place and if board is full know its tie already?
  def check_for_winner
    #define what wins the game
    win_combinations = [ [0,3,6], [0,4,8], [0,1,2], [1,4,7], [2,4,6], [2,5,8], [3,4,5], [6,7,8] ]
    #if sym fills any of these combos of 3, that player wins else, game is tie..play again?
    for i in 0..7
      win_combinations.each do |x| 
        if (@board[x[0]] == @board[x[1]] && @board[x[0]] ==  @board[x[2]] && @board[x[0]] != "" && @board[x[1]] != "" && @board[x[2]] != "")
          if @board[x[0]] == PLAYER1_SYM
            puts "Player 1 Wins!!!!!!"
          else
            puts "Player 2 Wins!!!!!!"
          end
          generate_board
          abort("game over")
        elsif unless @board.include? "" #check for tie once board is ful
          abort("Game is a tie")
          end
        else
        end
      end
    end
  end

end

z = TicTacToe.new