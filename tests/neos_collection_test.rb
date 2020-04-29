require "minitest/autorun"
require "minitest/pride"
require "./lib/neos_collection"

class NeosCollectionTest < Minitest::Test
  def test_it_exists
    collection = NeosCollection.new

    assert_instance_of NeosCollection, collection
  end

  def test_it_has_attributes
    collection = NeosCollection.new

    assert_equal [], collection.neos
    assert_equal ({}), collection.neos_info

  end

  def test_it_can_create_neo_objects
    collection = NeosCollection.new
    info = {name:"ryan", diameter:5, miss_distance: 10}

    neo = collection.create_neo(info)

    assert_instance_of Neo, neo
    assert_equal "ryan", neo.name
    assert_equal 5, neo.diameter
    assert_equal 10, neo.miss_distance
  end

  def test_it_can_add_neo_to_collection
    collection = NeosCollection.new
    info = {name:"ryan", diameter:5, miss_distance: 10}

    neo = collection.create_neo(info)

    assert_equal [], collection.neos

    collection.add_neo(neo)

    assert_equal [neo], collection.neos


  end
  def test_it_can_create_a_collection_of_neos
    info = [{name:"ryan", diameter:5, miss_distance: 10},
            {name:"robert", diameter:10, miss_distance: 20},
            {name:"richard", diameter:15, miss_distance: 30}]

    collection = NeosCollection.new(info)

    assert_equal [], collection.neos

    collection.create_collection

    assert_equal 3, collection.neos.length
    assert_instance_of Neo, collection.neos.first
    assert_instance_of Neo, collection.neos.last
    assert_equal "ryan", collection.neos.first.name
    assert_equal "richard", collection.neos.last.name

  end
end
