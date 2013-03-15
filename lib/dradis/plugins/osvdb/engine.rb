module Dradis
  module Plugins
    module OSVDB
      class Engine < ::Rails::Engine

        # Standard Rails Engine stuff
        isolate_namespace Dradis::Plugins::OSVDB
        engine_name 'dradis_osvdb'

        # use rspec for tests
        config.generators do |g|
          g.test_framework :rspec
        end

        # Connect to the Framework
        include Dradis::Core::Plugins::Base

        plugin_name 'OSVDB import'
        provides :import

        Dradis::Core::Plugins::register(Dradis::Plugins::OSVDB)

        # No need to initialize anything in this case
        # initializer "dradis.osvdb.<>" do |app|
        # end
      end
    end
  end
end
