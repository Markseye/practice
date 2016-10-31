require_relative 'mastermind'

include Mastermind

describe 'Code' do

    it 'should generate a code of length 4' do
      code = Code.new
      expect(code.gen_code.length).to eq(4)
    end

end

#if i wanted to make game more oo code have user input
#match length of code generate

describe 'Game' do

  #will generate new game when game method is called
  #and will use that throughout tests
  let (:game) {Game.new("1234")}

    it 'should check that guess 4 digit number' do
      expect(game.guess_valid?).to eq(true)
    end

    it 'should display each letter correctly guessed' do
      game.instance_variable_set(:@code, [1, 3, 3, 3])
      expect(game.check_each_num).to eq("1X3X")
    end

    #user wins should be last guess
    it 'should end game when user guess matches code' do
      game.instance_variable_set(:@code, "1234")
      expect(game.is_winner?).to eq(true)
    end

end