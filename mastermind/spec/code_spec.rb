require './code'

describe 'Code' do

  it "returns array containing code" do
    code = Code.generate_code
    expect(code.size).to eq(4)
  end

  it "returns array with only valid values" do
    c = ['R', 'G', 'B', 'Y', 'O', 'P']
    code = Code.generate_code
    (code.length).times do |i|
      expect(c).to include(code[i])
    end
  end

end