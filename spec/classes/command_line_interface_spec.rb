require_relative '../spec_helper'

describe CommandLineInterface do

  describe 'initialize' do
    it 'holds the current input from the user' do
      expect(described_class.new.last_input).to eq ''
    end
  end

end
