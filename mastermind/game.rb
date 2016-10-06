require './code'

class Game

  attr_accessor :user_guess
  attr_reader :code

  def initialize(code)
    display_rules
    get_guess
  end

  def display_rules

    puts "Welcome to Mastermind, the rules are as follows: \n
    Guess a four color combination (R,Y,B,P,O,G) string to \n
    match the randomly generated code. Once the guessed color \n
    location is correct, it will display that color. You have \n
    five guesses. Good luck!\n\n"

  end

  def get_guess
    @user_guess = ""
    unless @user_guess.length == 4 && check_letters(user_guess)
      puts "#{user_guess}, #{check_letters(user_guess)}"
      print "You must guess exactly 4 colors (R,Y,B,P,O,G).\nGuess here:"
      @user_guess = gets.chomp.upcase
    end
    check_guess(@user_guess)
  end

  def check_letters(letters)
    letters.split(/,\s||,||""/).each do |letter|
      ['R', 'G', 'B', 'Y', 'O', 'P'].include? letter
    end
    return true
  end

  def check_guess(user_code)
    puts "Your guess looks good"
  end

end