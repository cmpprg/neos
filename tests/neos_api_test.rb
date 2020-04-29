require 'minitest/autorun'
require 'minitest/pride'
require './lib/neos_api'

class NeosAPITest < Minitest::Test
  def setup
    @date = '2019-03-30'
    @api = NeosAPI.new(@date)
  end

  def test_it_exists
    assert_instance_of NeosAPI, @api
  end

  def test_it_can_connect_through_faraday
    assert_instance_of Faraday::Connection, @api.connection
  end

  def test_faraday_connection_has_proper_params
    assert_equal @date, @api.connection.params['start_date']
    assert @api.connection.params['api_key'] != nil
  end
end
