require './game'

describe 'Game' do

  it "returns array of size 4 containing user guess code" do
    pending("need to work on this")
    game = Game.new(["R", "G", "B", "Y"])
    u = game.check_guess(user_code)
    expect(user_code.size).to eq(4)
  end

end