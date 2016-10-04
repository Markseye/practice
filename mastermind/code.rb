require './game'

class Code

  @@colors = ['R', 'G', 'B', 'Y', 'O', 'P']
  def self.colors; @@colors; end

  def self.generate_code
    code = []
    4.times do |a|
      code << @@colors.sample
    end
    return code
  end

  code = self.generate_code
  game = Game.new(code)
  game.get_guess

end