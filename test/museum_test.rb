require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/museum'
require './lib/patron'

class Testmuseum < Minitest::Test
  def test_class_exists
    museum = Museum.new('Denver Museum of Nature and Science')

    assert_instance_of Museum, museum
  end

  def test_add_exhibit
    museum = Museum.new('Denver Museum of Nature and Science')
    museum.add_exhibit('Dead Sea Scrolls', 10)
    museum.add_exhibit('Gems and Minerals', 0)

    expected = {'Dead Sea Scrolls' => [10, []], 'Gems and Minerals'=> [0, []]}
    assert_equal expected, museum.exhibits
  end

  def test_admit_patron_and_add_revenue
    dmns = Museum.new('Denver Museum of Nature and Science')
    dmns.add_exhibit('Dead Sea Scrolls', 10)
    dmns.add_exhibit('Gems and Minerals', 0)

    bob = Patron.new('Bob')
    bob.add_interest('Gems and Minerals')
    bob.add_interest('Dead Sea Scrolls')
    bob.add_interest('Imax')

    sally = Patron.new('Sally')
    sally.add_interest('Dead Sea Scrolls')

    assert_equal 0, dmns.revenue
    dmns.admit(bob)
    dmns.admit(sally)
    assert_equal 20, dmns.revenue
  end

  def test_exhibit_tracking
    dmns = Museum.new('Denver Museum of Nature and Science')
    dmns.add_exhibit('Dead Sea Scrolls', 10)
    dmns.add_exhibit('Gems and Minerals', 0)
    dmns.add_exhibit('IMAX', 15)
    bonnie = Patron.new('Bonnie')
    bonnie.add_interest('Dead Sea Scrolls')
    bonnie.add_interest('Gems and Minerals')
    paul = Patron.new('Paul')
    paul.add_interest('Dead Sea Scrolls')
    paul.add_interest('IMAX')
    teddy = Patron.new('Teddy')
    teddy.add_interest('Dead Sea Scrolls')
    teddy.add_interest('IMAX')
    dmns.admit(bonnie)
    dmns.admit(paul)
    dmns.admit(teddy)

    assert %w[Bonnie Paul Teddy], dmns.exhibits['Dead Sea Scrolls']
    assert %w[Bonnie], dmns.exhibits['Gems and Minerals']
    assert %w[Paul Teddy], dmns.exhibits['IMAX']

    expected = ['Dead Sea Scrolls', 'IMAX', 'Gems and Minerals']
    assert_equal expected, dmns.exhibits_by_attendees

    dmns.remove_unpopular_exhibits(2)
    assert_equal ['Dead Sea Scrolls', 'IMAX'], dmns.exhibits_by_attendees
  end
end
