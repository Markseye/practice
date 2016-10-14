class Code

  COLORS = ['R', 'G', 'B', 'Y', 'O', 'P']

  def self.generate_code
    code = []
    4.times do |a|
      code << COLORS.sample
    end
    return code
  end

end