require 'spec_helper'

describe RSpec::Dry::Struct do
  it 'has a version number' do
    expect(RSpec::Dry::Struct::VERSION).not_to be nil
  end

  let(:instance) { Class.new.send(:include, described_class).new }

  describe '#have_attribute' do
    let(:types) { Dry::Types.module }
    subject { instance.have_attribute(:attr, types::String) }

    it 'returns a new matcher instance' do
      expect(subject).to be_an_instance_of(RSpec::Dry::Struct::Matcher)
      expect(subject.attr_name).to eq :attr
      expect(subject.attr_type).to eq types::String
    end
  end
end
