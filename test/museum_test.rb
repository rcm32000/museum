require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/museum.rb'

class Testmuseum < Minitest::Test
  def test_class_exists
    museum = Museum.new('Denver Museum of Nature and Science')

    assert_instance_of Museum, museum
  end

  def test_add_exhibit
    museum = Museum.new('Denver Museum of Nature and Science')
    museum.add_exhibit('Dead Sea Scrolls', 10)
    museum.add_exhibit('Gems and Minerals', 0)

    expected = {'Dead Sea Scrolls' => 10, 'Gems and Minerals'=> 0}
    assert_equal expected, museum.exhibits
  end
end
