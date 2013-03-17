require 'dradis/plugins/osvdb/api'
require 'dradis/plugins/osvdb/engine'
require 'dradis/plugins/osvdb/filters'
require 'dradis/plugins/osvdb/version'

module Dradis
  module Plugins
    module OSVDB
      # Connect to the Framework
      include Dradis::Core::Plugins::Base

      # These are provided by the above Plugins::Base
      self.plugin_name= 'OSVDB import'
      provides :import

      # Please register an account in the OSVDB site to get your API key. Steps:
      #   1. Create the account: http://osvdb.org/account/signup
      #   2. Find your key in http://osvdb.org/api
      BAD_API_KEY = '<your_API_key>'
      class Configuration < Dradis::Core::Configurator
        configure     :namespace => 'osvdb'
        setting       :api_key, :default => BAD_API_KEY
      end
    end
  end
end