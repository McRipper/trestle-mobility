ENV['RAILS_ENV'] ||= 'test'
require 'bundler/setup'
require 'rails/all'
require ENV.fetch('ASSET_PIPELINE', 'sprockets-rails') == 'propshaft' ? 'propshaft' : 'sprockets/railtie'
require 'trestle/mobility'
require "minitest/autorun"

class MobilityTestApp < Rails::Application
  config.root = File.expand_path('dummy', __dir__)
  config.eager_load = false
  config.secret_key_base = 'mobility-test-secret-' * 4
  config.i18n.available_locales = [:en, :it]
end

MobilityTestApp.initialize!
