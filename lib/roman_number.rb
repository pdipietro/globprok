# This class implement the concept of roman numbers
# There is an hash containing all the accepted roman single letter 'digit'


#this class implements the manipulation of roman numbers
class RomanNumber

  # This is a constant hash, containing all the predefined Roman 'single digit'
  # and all the allowed 'two digits' exception s
  Romans = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
             90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX', 
             5 => 'V', 4 => 'IV', 1 => 'I' }.freeze

  Romans_cod = { 'CM' => 900, 'CD' => 400, 'XC' => 90, 'XL' => 40, 'IX' => 9,
                 'IV' => 4, 'M' => 1000, 'D' => 500, 'C' => 100, 'L' => 50,
                 'X' => 10, 'V' => 5, 'I' => 1 }.freeze

  attr_accessor :rnumber # it is the roman number as a string
    
  def initialize(number)
    self.rnumber = number if number =~ /[MDCLXVI]+/       #pattern matching for Roman numbers
    self.rnumber = to_roman(number) if number.to_s =~ /[0-9]+/    # pattern matching for arabic numbers (without sign)
  end

  # This function convert a decimal number in it's equivalent roman representation
  # number: is the decimal number to be converted in it's roman equivalent
  def to_roman(number)
    acc = 0
    Romans.reduce('') do |acc, (arab, roman)|    
      whole_part, number = number.divmod(arab)
      acc << roman * whole_part
    end
  end

  # This function convert a romal number in it's equivalent arabic (decimal) representation
  # It iterates on the romans_cod table, starting with the 'two letter digits'
  def to_i
    num = rnumber
    acc = 0
    Romans_cod.each do |key, value|
      a = num.scan(/(?=#{key})/).count
      acc += value * a
      num = num.gsub(key, '')
    end
    acc.to_i
  end
end
