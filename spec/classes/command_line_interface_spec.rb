require_relative '../spec_helper'

describe CommandLineInterface do
  context 'starting the app' do
    describe 'last input' do
      it 'holds initial input from the user' do
        expect(described_class.new.last_input).to eq ''
      end

      it 'updates last input when new input is given' do
        cli = described_class.new
        cli.last_input = "Puppies"
        expect(cli.last_input).to eq 'Puppies'
      end
    end
  end
end
