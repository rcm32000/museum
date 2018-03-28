require './lib/patron'
require './lib/museum'

run = Runner.new
run.start

class Runner
  def start
    puts "What is the name of your museum?"
    input = gets.chomp
    puts "Welcome to the Grand Opening of the #{input}!!!\n"\
         "What would you like to do?\n"\
         "(E) to add an exhibit\n"\
         "(A) to admit a new patron to your museum\n"\
         "(R) to see your total revenue\n"\
         "(T) to see your most popular exhibits\n"\
         "(U) to remove your least popular exhibits\n"\
         '(Q) to quit and close down your museum'
    input = gets.chomp
    until input_valid? == true
      evaulate_input(input.downcase)
      puts  "Please choose one of the following:\n"\
            "(E) to add an exhibit\n"\
            "(A) to admit a new patron to your museum\n"\
            "(R) to see your total revenue\n"\
            "(T) to see your most popular exhibits\n"\
            "(U) to remove your least popular exhibits\n"\
            '(Q) to quit and close down your museum'
    end
  end

  def input_valid?
    'e' || 'E' || 'a' || 'A' || 'r' || 'R' || 't' || 'T' || 'u' || 'U' ||
    'q' || 'Q'
  end

  def evaluate_input(input)
    case input
    when 'p', 'play' then choose_level
    when 'q', 'quit' then quit_game.abort
    when 'i', 'instructions' then start_info
    end
    input
  end
end
