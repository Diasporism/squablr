require_relative '../spec_helper'

describe CommandLineInterface do
  let(:command_line_interface) { described_class.new }

  describe '#last_input' do
    context 'when the object is first created' do
      it 'defaults the value to be empty' do
        expect(command_line_interface.last_input).to eq nil
      end
    end

    context 'when the object is given a new input' do
      it 'updates the value' do
        command_line_interface.last_input = 'Puppies'
        expect(command_line_interface.last_input).to eq 'Puppies'
      end
    end
  end

  describe '#instructions' do
    it 'prints a set of instructions to help the user understand what to do' do
      text = 'Your robot lover is being snooty. What is your response?'
      expect(command_line_interface.instructions).to eq text
    end
  end

  describe '#responses' do
    it 'prints a set of responses' do
      response_list = ['A Sweet Nothing', 'A Passive-Aggressive Comment', 'A Backhanded Compliment']
      expect(command_line_interface.responses).to eq response_list
    end
  end
end
