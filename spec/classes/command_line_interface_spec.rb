require_relative '../spec_helper'

describe CommandLineInterface do
  let(:command_line_interface) { described_class.new }

  before do
    # Suppress all 'puts' statements in terminal when running specs by
    # stubbing the method call completely.
    allow(command_line_interface).to receive(:puts)
  end

  describe '#ask_user_for_input' do
    context 'when the user inputs "quit"' do
      it 'the app stops running' do
        allow(command_line_interface).to receive(:gets).and_return('quit')
        expect(command_line_interface).to receive(:exit_app)
        command_line_interface.ask_user_for_input
      end
    end

    context 'when the user inputs "help"' do
      it 'prints out instructions' do
        # This is a meta-programming trick to test recursive functions.
        # Rspec cannot test that the method is behaving correctly without this.
        # Source: http://blog.8thlight.com/cory-foy/2013/01/01/testing-recursion.html
        CommandLineInterface.class_eval do
          alias_method :ask_user_for_input_not_stubbed, :ask_user_for_input
        end

        allow(command_line_interface).to receive(:gets).and_return('help')
        expect(command_line_interface).to receive(:instructions)

        # Stub out the recursive call to avoid a stack level too deep error,
        # while simultaneously test that it does indeed behave recursively.
        expect(command_line_interface).to receive(:ask_user_for_input).once

        command_line_interface.ask_user_for_input_not_stubbed
      end
    end
  end

  describe '#instructions' do
    it 'prints a set of instructions to help the user understand what to do' do
      text = 'Your robot lover is being snooty. What do you want to respond with?'
      command_line_interface.instructions
      expect(command_line_interface.last_output).to eq text
    end
  end

  describe '#responses' do
    it 'prints a set of responses' do
      response_list = ['A Sweet Nothing', 'A Passive-Aggressive Comment', 'A Backhanded Compliment']
      command_line_interface.responses
      expect(command_line_interface.last_output).to eq response_list.join("\n")
    end
  end

  describe '#exit_app' do
    it 'prints a goodbye message to the user' do
      command_line_interface.exit_app
      expect(command_line_interface.last_output).to eq 'Bye!'
    end
  end
end
