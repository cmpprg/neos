require 'minitest/autorun'
require 'minitest/pride'
require './lib/near_earth_objects'

class NearEarthObjectsTest < Minitest::Test
  def test_a_date_returns_a_list_of_neos
    results = NearEarthObjects.new('2019-03-30')
    assert_equal '(2019 GD4)', results.collection[0].name
  end

  def test_it_exists
    neos = NearEarthObjects.new('2019-03-30')

    assert_instance_of NearEarthObjects, neos
  end

  def test_it_has_attributes
    neos = NearEarthObjects.new('2019-03-30')

    assert_equal Array, neos.collection.class
  end

  def test_largest_neo_diameter
    neos = NearEarthObjects.new('2019-03-30')

    assert_equal 10233, neos.largest_diameter
  end

  def test_it_can_find_total_number_of_neos
    neos = NearEarthObjects.new('2019-03-30')

    assert_equal 12, neos.total_neos
  end
end
