require_relative '../../spec_helper'

describe Pat do

  it 'exists' do
    expect(described_class).to be
  end

  it 'has a client attribute' do
    expect(described_class.new.client).to be
  end

end
