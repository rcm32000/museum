require './lib/patron.rb'
class Museum
  attr_reader :name, :exhibits, :revenue
  def initialize(name)
    @name = name
    @exhibits = {}
    @revenue = 0
  end

  def add_exhibit(name, cost)
    @exhibits[name] = cost
  end

  def admit(name)
    name.interests.each do |interest|
      (@revenue += exhibits[interest]) if exhibits.has_key?(interest)
    end
  end
end
