module Mastermind

  class Code

    attr_accessor :code

    def gen_code
      @code = 4.times.map{ rand(5) }.join("")
      @code
    end

  end

  class Game < Code

    attr_reader :code, :user_guess

    def initialize(user_guess, code: Code.new.gen_code)
      @code = code
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
c = Mastermind::Code.new


#g = Mastermind::Game.new
#g.get_user_guess("1234")