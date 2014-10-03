class CommandLineInterface
  INTRO_MESSAGE = 'Your robot lover is being snooty. How would you like to respond?'
  RESPONSE_OPTIONS_LIST = [
    'Enter "1" to send them a sweet nothing.',
    'Enter "2" to send them a passive-aggressive comment.',
    'Enter "3" to send them a backhanded compliment.',
    'Type "help" to see this list of commands again.',
    'Type "exit" to quit.'
  ]

  attr_reader :last_output

  def run
    print_instructions
    print_response_options
    ask_user_for_input
  end

  def ask_user_for_input
    print 'Enter a command: '
    input = gets.chomp
    parse(input)
  end

  def parse(input)
    case input
    when '1'
      tweet_sweet_nothing
      ask_user_for_input
    when '2'
      tweet_passive_aggressive_comment
      ask_user_for_input
    when '3'
      tweet_backhanded_compliment
      ask_user_for_input
    when 'help'
      puts "\n"
      print_response_options
      ask_user_for_input
    when 'exit'
      exit_app
    else
      puts "\nI don't know that command, try one of these:\n "
      print_response_options
      ask_user_for_input
    end
  end

  def tweet_sweet_nothing
    @last_output = 'If nothing lasts forever, can I be your nothing?'
    puts "\n#{last_output}\n "
  end

  def tweet_passive_aggressive_comment
    @last_output = 'I have neutral feelings towards you.'
    puts "\n#{last_output}\n "
  end

  def tweet_backhanded_compliment
    @last_output = "I don't know what's more gorgeous,\nyour shiny bald metal head\nor your souless, unmoving eyes."
    puts "\n#{last_output}\n "
  end

  def print_instructions
    @last_output = self.class::INTRO_MESSAGE
    puts "#{last_output}\n "
  end

  def print_response_options
    @last_output = self.class::RESPONSE_OPTIONS_LIST.join("\n")
    puts "#{last_output}\n "
  end

  def exit_app
    @last_output = 'Bye!'
    puts last_output
  end
end
