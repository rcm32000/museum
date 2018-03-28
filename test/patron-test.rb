require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/patron.rb'
require './lib/museum'

class TestPatron < Minitest::Test
  def test_class_exists
    patron = Patron.new('Bob')

    assert_instance_of Patron, patron
  end

  def test_name_and_zero_interests_default
    patron = Patron.new('Bobby')

    assert_equal 'Bobby', patron.name
    assert_equal [], patron.interests
  end

  def test_add_interests
    patron = Patron.new('Bonnie')
    patron.add_interest('Dead Sea Scrolls')
    patron.add_interest('Gems and Minerals')

    expected = ['Dead Sea Scrolls', 'Gems and Minerals']
    assert_equal expected, patron.interests
  end
end
