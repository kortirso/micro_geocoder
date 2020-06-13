# frozen_string_literal: true

module Api
  class V1 < Grape::API
    prefix 'api'
    version 'v1'
    format :json

    desc 'Returns the current API version'
    get do
      { version: 'v1' }
    end

    desc 'Returns coordinates of city'
    params do
      build_with Grape::Extensions::Hash::ParamBuilder
      requires :city, type: String, desc: 'City name'
    end
    get 'geocode' do
      coordinates = Geocoder.geocode(CGI.unescape(params[:city]))

      if coordinates.present?
        { coordinates: coordinates }
      else
        error!(ErrorSerializer.from_messages('Geocoding error'), 404)
      end
    end
  end
end
