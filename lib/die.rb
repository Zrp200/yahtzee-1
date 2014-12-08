class Die
  def initialize; roll; end

  def roll; @num = rand(6) + 1; end

  alias to_s num

  attr_reader :num
end
