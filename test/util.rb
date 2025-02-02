require "rest-client"
require "json"
require 'seatsio/exception'

BASE_URL = "https://api-staging.seatsio.net"

def create_test_user
  begin
    post = RestClient.post(BASE_URL + "/system/public/users/actions/create-test-user",{})
    JSON.parse(post)
  rescue
    raise Seatsio::Exception::SeatsioException.new("Failed to create a test user")
  end
end

def create_test_chart_from_file(file)
  chart_file = File.read(Dir.pwd + "/test/#{file}")
  chart_key = SecureRandom.uuid

  url = "#{BASE_URL}/system/public/#{@user["designerKey"]}/charts/#{chart_key}"
  post = RestClient.post(url, chart_file)

  if post.is_a?(RestClient::Response)
    chart_key
  else
    raise "Failed to create a chart from file test/sampleChart.json"
  end
end

def create_test_chart
  create_test_chart_from_file('sampleChart.json')
end

def create_test_chart_with_sections
  create_test_chart_from_file('sampleChartWithSections.json')
end

def create_test_chart_with_tables
  create_test_chart_from_file('sampleChartWithTables.json')
end

def create_test_chart_with_errors
  create_test_chart_from_file('sampleChartWithErrors.json')
end
