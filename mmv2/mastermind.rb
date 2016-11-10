module Mastermind

  class Code

    attr_accessor :code

    def gen_code
      @code = []
      return @code = 4.times.map{ rand(5) }
    end

  end

  class Game

    attr_accessor :guess_results, :count
    attr_reader :code

    def initialize(code: Code.new.gen_code)
      @count = 0
      @code = code
      @display_code = @code.join("")
      @guess_results = []
      #do I want this returned in initialize as I probably want to display guess results
    end

    #changed user gues to no longer be an instance variable because it should just be passed when guess is called
    def guess(user_guess)
      guess_valid?(user_guess) ? check_each_num(user_guess) : "Bad guess. Start over"
    end

    def guess_valid?(user_guess)
      return true if user_guess.match(/\A\d{#{Regexp.escape(@code.size.to_s).to_i}}\z/)
    end

    # check each value of user guess vs code generated and only display correct values
    def check_each_num(user_guess)
      @guess_results = []
      user_guess.split("").each_with_index do |x, index|
        @guess_results << (@code[index].to_s == user_guess[index] ? @code[index] : "X")
      end
      win_or_next(user_guess)
      puts @guess_results.join("")
    end

    def win_or_next(user_guess)
      is_winner?(user_guess) ? end_game(true) : next_turn
    end

    def next_turn
      turn_count >= 4 ? end_game(false) : get_guess
      return true
    end

    def get_guess
    end

    def turn_count
      @count += 1
    end

    def end_game(w_l)
      w_l ? puts("You won") : puts("You didn't guess correct after 5 turns. You lose")
      return true
    end

    def is_winner?
      return true if @user_guess == code
    end

  end
end

user_guess = gets.chomp
c = Mastermind::Game.new.guess(user_guess)


#g = Mastermind::Game.new
#g.get_user_guess("1234")