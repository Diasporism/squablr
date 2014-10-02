# Require all the gems that we are using
require 'rspec'
require 'require_all'

# Require all the files in are project so Rspec has access to them
require_rel '../app'

# Configure Rspec settings.
RSpec.configure do |config|
  # No one likes black and white text, so lets user colors :)
  config.color = true
end
