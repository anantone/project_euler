#Working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score. What is the total of all the name scores in the file?
class NamesScores

  private

  attr_writer :list_of_names

  def initialize(file)
    self.list_of_names = File.read(file).tr('"', '').split(',').sort
  end

  def alphabetical_value(name)
    name.codepoints.sum { |x| x - 64 }
  end

  public

  attr_reader :list_of_names

  def scores
    list_of_names.sum do |name|
      (list_of_names.index(name) + 1) * alphabetical_value(name)
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  puts NamesScores.new('0022_names.txt').scores
end
