# frozen_string_literal: true

module RouteHelpers
  def app
    described_class
  end

  def response_body
    JSON.parse(last_response.body)
  end
end
