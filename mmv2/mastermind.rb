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
    attr_reader :code, :user_guess

    def initialize(user_guess, code: Code.new.gen_code)
      @count = 0
      @code = code
      @display_code = @code.join("")
      puts "#{@code}"
      @user_guess = user_guess
      @guess_results = []
      guess_valid? ? check_each_num : "Bad guess. Start over"
    end

    def guess_valid?
      return true if @user_guess.match(/\A\d{#{Regexp.escape(@code.size.to_s).to_i}}\z/)
    end

    # check each value of user guess vs code generated and only display correct values
    def check_each_num
      @guess_results = []
      @user_guess.split("").each_with_index do |x, index|
        @guess_results << (@code[index].to_s == @user_guess[index] ? @code[index] : "X")
      end
      win_or_next
      @guess_results.join("")
    end

    def win_or_next
      is_winner? ? end_game(true) : next_turn
    end

    def next_turn
      puts "#{turn_count}"
      turn_count >= 4 ? end_game(false) : get_guess
    end

    def get_guess
    end

    def turn_count
      puts "#{@count += 1}...."
      @count += 1
    end

    def end_game(w_l)
      w_l ? puts("You won") : puts("You didn't guess correct after 5 turns. You lose")
    end

    def is_winner?
      return true if @user_guess == code
    end

  end
end

user_guess = gets.chomp
c = Mastermind::Game.new(user_guess)


#g = Mastermind::Game.new
#g.get_user_guess("1234")