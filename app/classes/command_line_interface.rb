class CommandLineInterface
  attr_reader :last_output

  def ask_user_for_input
    case gets.chomp
    when 'quit'
      exit_app
    when 'help'
      instructions
      ask_user_for_input
    else
      ask_user_for_input
    end
  end

  def instructions
    @last_output = 'Your robot lover is being snooty. What do you want to respond with?'
    puts last_output
  end

  def responses
    response_list = [
      'A Sweet Nothing',
      'A Passive-Aggressive Comment',
      'A Backhanded Compliment'
    ]

    @last_output = response_list.join("\n")
    puts last_output
  end

  def exit_app
    @last_output = 'Bye!'
    puts last_output
  end
end
