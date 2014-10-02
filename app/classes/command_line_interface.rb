class CommandLineInterface
  attr_accessor :last_input

  def run
    while last_input != 'quit'
      case last_input
      when 'help'
        "Stuff"
      else
        "other stuff"
      end
    end
    "Bye!"
  end

  def instructions
    'Your robot lover is being snooty. What do you want to respond with?'
  end

  def responses
    ['A Sweet Nothing', 'A Passive-Aggressive Comment', 'A Backhanded Compliment']
  end
end
