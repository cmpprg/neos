require './lib/neos_api'
require './lib/neos_collection'

class NearEarthObjects

  attr_reader :collection
  def initialize(query_date)
    neos_info = NeosAPI.new(query_date).neos_object_data
    @collection = NeosCollection.new(neos_info).create_collection
  end

  def largest_diameter
    collection.map { |neo| neo.diameter.to_i }.max
  end

  def total_neos
    collection.length
  end

  def max_character_length_of(attribute)
    collection.map { |neo| neo.send("#{attribute}").length }.max
  end

end
