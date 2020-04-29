class Neo

  attr_reader :name, :diameter, :miss_distance
  def initialize(neo_info)
    @name = neo_info[:name]
    @diameter = neo_info[:diameter]
    @miss_distance = neo_info[:miss_distance]
  end
  
end
