#application environment

require 'bundler/setup'
Bundler.require(:default)

require_relative './brewery_cli/cli.rb'
require_relative './brewery_cli/api.rb'
require_relative './brewery_cli/brewery.rb'