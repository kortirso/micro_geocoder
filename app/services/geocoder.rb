# frozen_string_literal: true

require 'csv'

module Geocoder
  extend self

  def geocode(city)
    data[city]
  end

  def data
    @data ||= load_data!
  end

  private

  def load_data!
    @data = CSV.read(data_path, headers: true).inject({}) do |result, row|
      city = row['city']
      lat = row['geo_lat'].to_f
      lon = row['geo_lon'].to_f
      result[city] = [lat, lon]
      result
    end
  end

  def data_path
    @data_path ||= Application.root.concat(Settings.data.path)
  end
end
