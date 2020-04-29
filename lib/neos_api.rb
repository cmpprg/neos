require 'faraday'
require 'figaro'

Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../../config/application.yml', __FILE__))
Figaro.load

class NeosAPI

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

  private

  def date
    @date
  end
end
