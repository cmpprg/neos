require 'faraday'
require 'figaro'

Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../../config/application.yml', __FILE__))
Figaro.load

class NeosAPI
  attr_reader :date
  def initialize(query_date)
    @date = query_date
  end

  def connection
    Faraday.new(
      url: 'https://api.nasa.gov',
      params: { start_date: date, api_key: ENV['nasa_api_key']}
    )
  end

  def gather_neos_info
    connection.get('/neo/rest/v1/feed')
  end

  def parse_neos_info
    JSON.parse(gather_neos_info.body, symbolize_names: true)
  end

  def neos_from_query_date
    parse_neos_info[:near_earth_objects][:"#{date}"]
  end

  def neos_object_data
    neos_from_query_date.map do |neo|
      { name: neo[:name],
        diameter: "#{neo[:estimated_diameter][:feet][:estimated_diameter_max].to_i} ft",
        miss_distance: "#{neo[:close_approach_data][0][:miss_distance][:miles].to_i} miles" }
    end
  end

end
