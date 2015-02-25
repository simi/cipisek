require 'spec_helper'

describe Cipisek::Utils do
  it 'underscorize string' do
    expect(Cipisek::Utils.underscore("userId")).to eq("user_id")
  end
end
