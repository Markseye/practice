module Mastermind

  class Code

    attr_accessor :code

    def gen_code
      @code = []
      return @code = 4.times.map{ rand(5) }
    end

  end

  class Game

    attr_accessor :guess_results, :count, :tot_guess_results
    attr_writer :user_guess
    attr_reader :code

    def initialize(code: Code.new.gen_code)
      @count = 0
      @code = code
      @tot_guess_results = []
    end

    #process guess
    def guess(user_guess)
      turn_count
      @user_guess = user_guess
      guess_valid? ? check_each_num : "Bad guess. Start over"
    end

    def guess_valid?
      return true if @user_guess.match(/\A\d{#{Regexp.escape(@code.size.to_s).to_i}}\z/)
    end

    # check each value of user guess vs code generated and only display correct values
    def check_each_num
      ind_guess_results = []
      @user_guess.split("").each_with_index do |x, index|
        ind_guess_results << (@code[index].to_s == @user_guess[index] ? @code[index] : "X")
      end
      @tot_guess_results << ind_guess_results
      win_or_next
      @tot_guess_results[(@count-1).to_i].join("")
      #should display this as to let user know what portion of guess is match
    end

    def win_or_next
      is_winner? ? end_game(true) : next_turn
    end

    def next_turn
      @count >= 4 ? end_game(false) : get_guess
      return true
    end

    def get_guess
      #way to inform interface that next guess is needed
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
c = Mastermind::Game.new
c.guess(user_guess)

#if game is called after game, don't increment guess and throw exception

#g = Mastermind::Game.new
#g.get_user_guess("1234")