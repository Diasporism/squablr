class TwitterAccount
  def initialize
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['']
      config.consumer_secret     = ENV['']
      config.access_token        = ENV['']
      config.access_token_secret = ENV['']
    end
  end
end
