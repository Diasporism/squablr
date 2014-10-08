class CommandLineInterface
  INTRO_MESSAGE      = 'Welcome to Squablr! Who would you like to play as?'

  ROBOT_OPTIONS_LIST = [
    'Enter "1" to play as RoboPat3000.',
    'Enter "2" to play as RoboSam3000.'
  ]

  TWEET_OPTIONS_LIST = [
    'Enter "1" to send them a sweet nothing.',
    'Enter "2" to send them a passive-aggressive comment.',
    'Enter "3" to send them a backhanded compliment.',
    'Type "help" to see this list of commands again.',
    'Type "exit" to quit.'
  ]

  attr_reader   :last_output
  attr_accessor :selected_robot

  def run
    print_welcome_message
    print_robot_selection_options
    prompt_user_for_robot_selection
    print_scenario
    print_tweet_options
    ask_user_for_input
  end

  def prompt_user_for_robot_selection
    print 'Enter a command: '
    input = gets.chomp
    parse_robot_selection(input)
  end

  def ask_user_for_input
    print 'Enter a command: '
    input = gets.chomp
    parse_tweet_selection(input)
  end

  def parse_robot_selection(input)
    if input == '1'
      assign_robot('Pat')
    elsif input == '2'
      assign_robot('Sam')
    else
      puts "\nThat's not a valid option.\n "
      print_robot_selection_options
      prompt_user_for_robot_selection
    end
  end

  def parse_tweet_selection(input)
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
      print_tweet_options
      ask_user_for_input
    when 'exit'
      exit_app
    else
      puts "\nI don't know that command, try one of these:\n "
      print_tweet_options
      ask_user_for_input
    end
  end

  def tweet_sweet_nothing
    current_robot.tweet_sweet_nothing
  end

  def tweet_passive_aggressive_comment
    current_robot.tweet_passive_aggressive_comment
  end

  def tweet_backhanded_compliment
    current_robot.tweet_backhanded_compliment
  end

  def print_welcome_message
    @last_output = self.class::INTRO_MESSAGE
    puts "#{last_output}\n "
  end

  def print_robot_selection_options
    @last_output = self.class::ROBOT_OPTIONS_LIST.join("\n")
    puts "#{last_output}\n "
  end

  def print_scenario
    @last_output = "\nHey, #{selected_robot}! Your robot lover has been saying uncool things about you on Twitter. How do you want to respond?"
    puts "#{last_output}\n "
  end

  def print_tweet_options
    @last_output = self.class::TWEET_OPTIONS_LIST.join("\n")
    puts "#{last_output}\n "
  end

  def assign_robot(name)
    self.selected_robot = name
  end

  def current_robot
    Object.const_get(selected_robot).new
  end

  def exit_app
    @last_output = 'Bye!'
    puts last_output
  end
end
