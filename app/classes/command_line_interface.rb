class CommandLineInterface
  INSTRUCTIONS  = 'Your robot lover is being snooty. How would you like to respond?'
  RESPONSE_LIST = [
    'Enter "1" to send them a sweet nothing.',
    'Enter "2" to send them a passive-aggressive comment.',
    'Enter "3" to send them a backhanded compliment.'
  ]

  attr_reader :last_output

  def run
    print_instructions
    print_responses
    ask_user_for_input
  end

  def ask_user_for_input
    input = gets.chomp
    parse(input)
  end

  def parse(input)
    case input
    when 'exit'
      exit_app
    when 'help'
      ask_user_for_input
    else
      ask_user_for_input
    end
  end

  def print_instructions
    @last_output = self.class::INSTRUCTIONS
    puts last_output
  end

  def print_responses
    @last_output = self.class::RESPONSE_LIST.join("\n")
    puts last_output
  end

  def exit_app
    @last_output = 'Bye!'
    puts last_output
  end
end
