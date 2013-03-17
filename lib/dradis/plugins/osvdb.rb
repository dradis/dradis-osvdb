require 'dradis/plugins/osvdb/api'
require 'dradis/plugins/osvdb/engine'
require 'dradis/plugins/osvdb/filters'
require 'dradis/plugins/osvdb/version'

module Dradis
  module Plugins
    module OSVDB
      BAD_API_KEY = '<your_API_key>'

      # Please register an account in the OSVDB site to get your API key. Steps:
      #   1. Create the account: http://osvdb.org/account/signup
      #   2. Find your key in http://osvdb.org/api
      class Configuration < Dradis::Core::Configurator
        configure     :namespace => 'osvdb'
        setting       :api_key, :default => BAD_API_KEY
      end
    end
  end
end