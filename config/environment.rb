# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
KNKF::Application.initialize!
#config.action_mailer.default_url_options = { :host => 'localhost' }
config.action_mailer.default_url_options = { :host => 'koloksztalceniafilozoficznego.herokuapp.com' }