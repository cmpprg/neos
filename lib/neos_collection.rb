require './lib/neo'

class NeosCollection

  attr_reader :neos, :neos_info
  def initialize(info = {})
    @neos_info = info
    @neos = []
  end

  def create_neo(neo_info)
    Neo.new(neo_info)
  end

  def add_neo(neo_object)
    neos << neo_object
  end

  def create_collection
    neos_info.each do |neo_info|
      add_neo(create_neo(neo_info))
    end
  end

end
