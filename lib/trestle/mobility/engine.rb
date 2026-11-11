module Trestle
  module Mobility
    class Engine < Rails::Engine
      initializer "trestle.mobility.assets" do
        if defined?(Sprockets)
          config.assets.precompile << "trestle/mobility.css" << "trestle/mobility.js"
        end
      end
    end
  end
end
