# frozen_string_literal: true

class NumberLetters
  DIGITS = { 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight',
             9 => 'nine' }.freeze
  TEENS = { 10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen',
            16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen' }.freeze
  DECADES = { 20 => 'twenty', 30 => 'thirty', 40 => 'forty', 50 => 'fifty', 60 => 'sixty', 70 => 'seventy',
              80 => 'eighty', 90 => 'ninety' }.freeze

  attr_accessor :maximum

  def initialize(maximum)
    self.maximum = maximum
  end

  def total_letters
    (1..maximum).sum do |number|
      length_in_letters(number)
    end
  end

  def length_in_letters(number)
    if number.zero?
      0
    elsif number < 10
      DIGITS[number].length
    elsif number < 20
      TEENS[number].length
    elsif number < 100
      DECADES[number - (number % 10)].length + length_in_letters(number % 10)
    elsif number < 1000
      return DIGITS[number / 100].length + 'hundred'.length if (number % 100).zero?

      DIGITS[number / 100].length + 'hundred'.length + 'and'.length + length_in_letters(number - (number / 100) * 100)

    elsif number == 1000
      'one'.length + 'thousand'.length
    end
  end
end
