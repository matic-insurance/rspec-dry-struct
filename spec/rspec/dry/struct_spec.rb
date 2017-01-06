require 'spec_helper'

describe RSpec::Dry::Struct do
  it 'has a version number' do
    expect(RSpec::Dry::Struct::VERSION).not_to be nil
  end

  let(:instance) { Class.new.send(:include, described_class).new }

  describe '#have_attribute' do
    Types = Dry::Types.module
    subject { instance.have_attribute(:attr, Types::String) }

    it { is_expected.to be_an_instance_of(RSpec::Dry::Struct::Matcher) }
    its(:attr_name) { is_expected.to eq :attr }
    its(:attr_type) { is_expected.to eq Types::String }
  end
end
