# This class implement the concept of galactic numbers
class GalacticNumber
  # contains the list of simple galactic numbers (gold, prok, pish, tegj)
  @@galactic_digit = {}
  # contains list & value of the coin
  @@galactic_coin = {}

  attr_accessor :gnumber, :value

  # A galactic number is created giving it its name and its value
  def initialize(options = {})
    self.gnumber = options[:gnumber]
    self.value = options[:value]
  end

  # this method add a new value to the @@galactic_digit hash
  # if an element with the same key already exists, it will be replaced
  def add
    # RomanNumber.new(nnn).add
    @@galactic_digit[gnumber] = self.value
  end

  # this method find non defined digits, and calculate their value
  # then add the digit and it's value to the @@galactic_coin hash
  # each gnumber is splitted into single digits
  # if it is a galactic digit, its roman value is concatenated to acc
  # if it is not a galactic digit it must be a galactic coin
  # so its value is calculated by dividing the given value by the
  # value of the acc variable converted from romans
  # the result is added (or replaced if already exists) in @galactic coin
  def discover_value
    acc = ''
    gnumber.split.each do |gdigit|
      val = @@galactic_digit[gdigit] # get the corrispondent Roman digit
      if val.nil?
        roman = RomanNumber.new(acc).to_i
        @@galactic_coin[gdigit] = value.to_f / roman # create a new galactic coin
      else                              # the digit has an equivalent roman digit
        acc << val                      # and is accumulated in a string to produce a roman number
      end
    end
  end

  # this method converts a galactic number in its equivalent decimal representation
  def to_number
    acc = ''
    mult = 1
    gnumber.split.each do |gdigit| # each gnumber is splitted into tokens (a single digit )
      val = @@galactic_digit[gdigit] # get the corrispondent Roman digit
      if val.nil?
        mult *= @@galactic_coin[gdigit]
      else                              # the digit has an equivalent roman digit
        acc << val         # so it is accumulated in a string to produce a roman number
      end
    end
    mult * RomanNumber.new(acc).to_i
  end
end
