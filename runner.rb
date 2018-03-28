require './lib/patron'
require './lib/museum'

run = Runner.new
run.start

class Runner
  def start
    puts "What is the name of your museum?"
    input = gets.chomp
    Museum.new(input)
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
    when 'e', 'E' then append_exhibit
    when 'a', 'A' then add_a_patron
    when 'r', 'R' then check_revenue
    when 't', 'T' then check_popularity
    when 'u', 'U' then remove_unpopular
    when 'q', 'Q' then quit.abort
    end
    input
  end

  def append_exhibit
    puts 'What is the name of your exhibit and cost to vist it (ex: '\
    'Dinosaurs, 10)?'
    input = gets.chomp
    until exhibit_valid? == true
      add_exhibit(input)
      puts 'Please include name and cost (ex: Dinosaurs, 10)'
    end
  end

  def exhibit_valid?
    input.include?(Integer)
  end

  def add_a_patron
    puts 'What is the name of your patron?'
    input = gets.chomp
    Patron.new(input)
    puts "What exhibit(s) does your patron enjoy?\n"\
    'Please type (D)one when you are finished.'
    until patron_valid? == true
      patron.add_interest(input)
      "What else are they interested in?\n"\
      'Please type (D)one when you are finished.'
    end
  end

  def patron_valid?
    'd' || 'done'
  end
end
