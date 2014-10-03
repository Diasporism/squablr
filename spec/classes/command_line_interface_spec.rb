require_relative '../spec_helper'

describe CommandLineInterface do
  let(:command_line_interface) { described_class.new }

  before do
    # Suppress all 'puts' and 'print' statements in terminal when
    # running specs by stubbing the method call completely.
    allow(command_line_interface).to receive(:puts)
    allow(command_line_interface).to receive(:print)
  end

  describe '#run' do
    before { expect(command_line_interface).to receive(:ask_user_for_input) }

    it 'prints the instructions for the user to read' do
      expect(command_line_interface).to receive(:print_instructions)
      command_line_interface.run
    end

    it 'prints options that the user can choose from' do
      expect(command_line_interface).to receive(:print_response_options)
      command_line_interface.run
    end
  end

  describe '#ask_user_for_input' do
    before { expect(command_line_interface).to receive(:parse) }

    it 'prompts the user for input' do
      expect(command_line_interface).to receive(:gets).and_return('value')
      command_line_interface.ask_user_for_input
    end
  end

  describe '#parse' do
    context 'when the user inputs "exit"' do
      it 'the app stops running' do
        expect(command_line_interface).to receive(:exit_app)
        command_line_interface.parse('exit')
      end
    end

    context 'when the user inputs "1"' do
      it 'tweets a sweet nothing' do
        # expect(command_line_interface).to receive(:tweet_sweet_nothing)
        # expect(command_line_interface).to receive(:ask_user_for_input)
        # command_line_interface.parse('1')
      end
    end

    context 'when the user inputs "2"' do
      it 'tweets a passive-aggressive comment' do
        # expect(command_line_interface).to receive(:tweet_passive_aggressive_comment)
        # expect(command_line_interface).to receive(:ask_user_for_input)
        # command_line_interface.parse('2')
      end
    end

    context 'when the user inputs "3"' do
      it 'tweets a backhanded compliment' do
        # expect(command_line_interface).to receive(:tweet_backhanded_compliment)
        # expect(command_line_interface).to receive(:ask_user_for_input)
        # command_line_interface.parse('3')
      end
    end

    context 'when the user inputs "help"' do
      it 'prints out the list of commands and prompts the user for input again' do
        expect(command_line_interface).to receive(:print_response_options)
        expect(command_line_interface).to receive(:ask_user_for_input)
        command_line_interface.parse('help')
      end
    end

    context 'when the user inputs anything that is not a valid command' do
      it 'prints out instructions and prompts the user for input again' do
        expect(command_line_interface).to receive(:print_response_options)
        expect(command_line_interface).to receive(:ask_user_for_input)
        command_line_interface.parse('qwerty')
      end
    end
  end

  describe '#print_instructions' do
    it 'prints a set of instructions to help the user understand what to do' do
      command_line_interface.print_instructions
      expect(command_line_interface.last_output).to eq described_class::INTRO_MESSAGE
    end
  end

  describe '#print_response_options' do
    it 'prints a set of responses' do
      command_line_interface.print_response_options
      response_list = described_class::RESPONSE_OPTIONS_LIST.join("\n")
      expect(command_line_interface.last_output).to eq response_list
    end
  end

  describe '#exit_app' do
    it 'prints a goodbye message to the user' do
      command_line_interface.exit_app
      expect(command_line_interface.last_output).to eq 'Bye!'
    end
  end
end
