# frozen_string_literal: true

class Application
  def self.call(_env)
    [200, {}, ['MicroGeocoder']]
  end

  def self.root
    File.expand_path('..', __dir__)
  end

  def self.environment
    ENV['RACK_ENV'].to_sym
  end
end
