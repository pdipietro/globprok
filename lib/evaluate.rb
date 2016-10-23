# this class evaluates any line in input to the calculator
class Evaluate
  # the eval line check for the following 4 different patterns
  # name is value
  # name [n times] is value Credits
  # how much is 'name '* ?$
  # how many Credits is 'name '* ?
  # everything is not intercepted by the pattern matcher is an input error
  # and is catched by the last else statement
  # require_relative 'lib/GalacticNumber'

  attr_accessor :line

  def initialize(line)
    self.line = line
  end

  def evaluate
    # parse "glob is I"
    if (x = line.match(/(.+)\s+is\s+([IVXLCDM])/))
      y=GalacticNumber.new(gnumber: x[1], value: x[2]).add
    # parse "glob glob Silver is 34 Credits"
    elsif (x = line.match(/([\s\w]+) is (\d+) Credits/))
      GalacticNumber.new(gnumber: x[1], value: x[2]).discover_value
    # parse "how much is pish tegj glob glob ?"
    elsif (x = line.match(/how\s+much\s+is\s+([\s\w]+)\s*\?/))
      result = GalacticNumber.new(gnumber: x[1]).to_number
      answer = %(#{x[1]}is #{result})
    # parse "how many Credits is glob prok Iron ?"
    elsif (x = line.match(/how\s+many\s+Credits\s+is\s+([\s\w]+)\s*\?/))
      result = GalacticNumber.new(gnumber: x[1]).to_number
      answer = %!#{x[1]}is #{'%g' % ('%.2f' % result)} Credits!
    else
      answer = %(I have no idea what you are talking about)
    end
    answer
  end
end
