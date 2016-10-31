module Mastermind

  class Code

    attr_accessor :code

    def gen_code
      @code = []
      return @code = 4.times.map{ rand(5) }
    end

  end

  class Game

    attr_accessor :guess_results
    attr_reader :code, :user_guess

    def initialize(user_guess, code: Code.new.gen_code)
      @code = code
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
      puts "#{@code}"
      @user_guess.split("").each_with_index do |x, index|
        @guess_results << (@code[index].to_s == @user_guess[index] ? @code[index] : "X")
      end
      puts "#{@guess_results.join("")}"
      @guess_results.join("")
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