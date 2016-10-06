require './code'

describe 'Code' do

  it "returns array containing code" do
    code = Code.generate_code
    expect(code.size).to eq(4)
  end

end