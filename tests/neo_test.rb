require 'minitest/autorun'
require 'minitest/pride'
require './lib/neo'

class NeoTest < Minitest::Test
  def setup
    info = {name:"Neo Name", diameter: 5, miss_distance: 10}
    @neo = Neo.new(info)
  end

  def test_it_exists
    assert_instance_of Neo, @neo
  end

  def test_it_has_attributes
    assert_equal "Neo Name", @neo.name
    assert_equal 5, @neo.diameter
    assert_equal 10, @neo.miss_distance
  end
end
