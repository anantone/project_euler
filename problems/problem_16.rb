class PowerDigitSum

  private

  attr_writer :number, :power

  def initialize(number, power)
    self.number = number
    self.power = power
  end

  public

  attr_reader :number, :power

  def sum
    digits = number ** power
    digits.to_s.chars.map { |char| char.to_i }.sum
  end

end

if __FILE__ == $PROGRAM_NAME
  puts PowerDigitSum.new(2, 1000).sum
end
