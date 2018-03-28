require './lib/patron.rb'
class Museum
  attr_reader :name, :exhibits, :revenue
  def initialize(name)
    @name = name
    @exhibits = {}
    @revenue = 0
  end

  def add_exhibit(name, cost, patrons = [])
    @exhibits[name] = cost, patrons
  end

  def admit(patron)
    patron.interests.map! do |interest|
      if exhibits.has_key?(interest)
        @revenue += exhibits[interest][0]
        @exhibits[interest][1] << patron.name
      end
    end
    @exhibits
  end

  def exhibits_by_attendees
    exhibits = @exhibits.sort do |exhibit1, exhibit2|
      exhibit2[1][1].count <=> exhibit1[1][1].count
    end
    order = []
    exhibits.each do |index|
      order << index[0]
    end
    order
  end

  def remove_unpopular_exhibits(attendance)
    @exhibits.delete_if do |key, value|
      value[1].count < 2
    end
  end
end
