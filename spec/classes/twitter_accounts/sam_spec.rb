require_relative '../../spec_helper'

describe Sam do

  it 'inherits from TwitterAccount' do
    expect(described_class < TwitterAccount).to eq true
  end

end