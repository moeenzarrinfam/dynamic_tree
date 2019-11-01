# frozen_string_literal: true

RSpec::Matchers.define :match_json do |expected|
  match do |query|
    @query = JMESPath.search(query, JSON.parse(response.body, symbolize_names: true))
    @query == expected
  end

  def failure_message
    "expected: #{expected} \r\ngot: #{@query}"
  end
end
