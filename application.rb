# application.rb
require 'grape'
require 'mongoid'

Mongoid.load! "config/mongoid.config"

# Load files from the models and api folders
Dir["#{File.dirname(__FILE__)}/app/models/**/*.rb"].each { |f| require f }
Dir["#{File.dirname(__FILE__)}/app/api/**/*.rb"].each { |f| require f }

# Grape API class
# Inherit from it for future controllers
module API
  class Root < Grape::API
    format :json
    prefix :api

    # endpoint
    get :status do
      { status: 'OK' }
    end
  end
end

VerboseEureka = Rack::Builder.new {

  map "/" do
    run API::Root
  end

}
