require './code'

class Game

  attr_accessor :user_guesses, :board_status, :game_board_status
  attr_reader :game_code

  def initialize(game_code)
    @game_code = game_code
    @previous_board_status = []
    @count = 0
    display_rules
    get_guess
  end

  def display_rules
    puts "\n\tWelcome to Mastermind, the rules are as follows: \n
    Guess a four color combination (R,Y,B,P,O,G) string to \n
    match the randomly generated code. Once the guessed color \n
    location is correct, it will display that color. You have \n
    five guesses. Good luck!\n\n"
  end

  def get_guess
    @user_guess = ""
    puts @count
    if @count >= 5
      abort("You guessed 5 times incorrectly. You Lose")
    else
      while length_letters_check
        print "You must guess exactly 4 colors (R,Y,B,P,O,G).\nGuess here:"
        @user_guess = gets.chomp.upcase
      end
    end
    @count += 1
    check_guess(@user_guess)
  end

  def length_letters_check
    @user_guess.length != 4 || !check_letters(@user_guess)
  end

  def check_letters(letters)
    @user_guesses = []
    letters.split(/,\s||,||""/).each do |letter|
      @user_guesses << (['R', 'G', 'B', 'Y', 'O', 'P'].include? (letter))
    end
    !@user_guesses.include? (false)
  end

  def check_guess(user_code)
    @guess_board_status = []
    (0..3).each do |i|
      @guess_board_status << (user_code[i] == game_code[i] ? game_code[i] : "X")
    end
    results(@guess_board_status)
  end

  def results(board_status)
    puts "Here's how you guessed"
    board_status.each { |i| print "#{i}"}
    if board_status.include? ("X")
      puts "\nGuess Again"
      get_guess
    else
      abort("\nYou Guessed Correctly! You Win!")
    end
  end
end