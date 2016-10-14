require './code'
require './game'

code = Code.generate_code
game = Game.new(code)
game.display_rules
game.get_guess