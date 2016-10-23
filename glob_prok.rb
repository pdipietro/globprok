# main module
# this module is the entry point to the 'glob prok pish tegj' calculator
# it run the calculator against the 'input.txt' file
# then allows the user to ask some more questions.
module GlobProk
  require_relative 'lib/roman_number'
  require_relative 'lib/galactic_number'
  require_relative 'lib/evaluate'
  require 'pry'

  def self.learn_and_answer(file_name)
    output = []
    File.open(file_name, 'r').each_line do |line|
      puts line
      output << Evaluate.new(line).evaluate
    end

    puts
    output.each do |line|
      puts line unless line.nil?
    end
  end

  # program starts here

  puts %(Welcome to Inter-Galactic Currency Calculator!!!)

  # it reads the input file and produce the output as in the spec
  learn_and_answer(%(input.txt))

  puts %(Calculator initialized and ready to answer your questions!)
  puts %(Ask a question: (Q: Exit))

  loop do
    question = gets.chomp

    case question
    when 'Q', 'q'
      break
    else
      answer = Evaluate.new(question).evaluate
      puts answer
    end
  end
end
