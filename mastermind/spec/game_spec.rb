require './game'

describe 'Game' do

  it "returns array of size 4 containing user guess code" do
    pending("need to work on this")
    game = Game.new(["R", "G", "B", "Y"])
    u = game.check_guess(user_code)
    expect(user_code.size).to eq(4)
  end

  it "checks value of user guess in allowed choices" do
  end

  it "ends game when user guess matches game code" do
  end
end

#need spec for entered amount being 4
#need check for letters being guess in array of @@colors
#game ends on matched arrays of user game to game_code