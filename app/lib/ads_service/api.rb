# frozen_string_literal: true

module AdsService
  module Api
    def update_coordinates(id, coordinates, correlation_id)
      body = {
        correlation_id: correlation_id,
        ad:             {
          lat: coordinates ? coordinates[0] : nil,
          lon: coordinates ? coordinates[1] : nil
        }
      }.to_json

      connection.put("ads/#{id}", body)
    end
  end
end
