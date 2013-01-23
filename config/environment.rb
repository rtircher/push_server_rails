# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
PushServer::Application.initialize!


# RAPNS app creation
unless Rapns::Apns::App.find_by_name("ios_app")
  app = Rapns::Apns::App.new
  app.name = "ios_app"
  app.certificate = File.read("tools/development.pem")
  app.environment = "development"
  # app.password = "certificate password"
  app.connections = 1
  app.save!
end
