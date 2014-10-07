class Sam
  attr_reader :client
  
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['SAM_CONSUMER_KEY']
      config.consumer_secret     = ENV['SAM_CONSUMER_SECRET']
      config.access_token        = ENV['SAM_ACCESS_TOKEN']
      config.access_token_secret = ENV['SAM_ACCESS_TOKEN_SECRET']
    end
  end

  def tweet_sweet_nothing
    client.update('@RoboPat3000 If nothing lasts forever, can I be your nothing?')
  end

  def tweet_passive_aggressive_comment
    client.update('@RoboPat3000 I have neutral feelings towards you.')
  end

  def tweet_backhanded_compliment
    client.update("@RoboPat3000 I don't know what's more gorgeous, your shiny bald metal head or your souless, unmoving eyes.")
  end
end
