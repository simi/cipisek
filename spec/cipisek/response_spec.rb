require 'spec_helper'

describe Cipisek::Response do
  let(:raw_hash) {
    {
      "status" => 200,
      "statusMessage" => 'OK',
      "session" => 'session_key',
      "sessionStarted" => DateTime.now
    }
  }
  subject { described_class.new(raw_hash) }

  it 'respond to status' do
    expect(subject.status).to eq(raw_hash["status"])
  end

  it 'respond to status_message' do
    expect(subject.status_message).to eq(raw_hash["statusMessage"])
  end

  it 'respond to session' do
    expect(subject.session).to eq(raw_hash["session"])
  end

  it 'respond to sessionStarted' do
    expect(subject.session_started).to eq(raw_hash["sessionStarted"])
  end
end
