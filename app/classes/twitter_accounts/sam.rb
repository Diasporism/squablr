class Sam < TwitterAccount
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
