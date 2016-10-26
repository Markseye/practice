module Mastermind

  class Code

    attr_accessor :code

    def gen_code
      return @code = 4.times.map{ rand(5) }.join("")
    end

  end

  class Game

    attr_reader :code, :user_guess

    def initialize(user_guess, code: Code.new.gen_code)
      @code = code
      puts "#{@code}"
      @user_guess = user_guess
      guess_valid? ? is_winner? : "bad"
    end

    def guess_valid?
      return true if @user_guess =~ /\A\d{#{Regexp.escape(code.length.to_s).to_i}}\z/
    end

    def is_winner?
      return true if @user_guess == @code
    end

  end
end

user_guess = gets.chomp
c = Mastermind::Game.new(user_guess)


#g = Mastermind::Game.new
#g.get_user_guess("1234")