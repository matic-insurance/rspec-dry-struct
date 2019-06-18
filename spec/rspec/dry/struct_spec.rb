require 'spec_helper'

describe RSpec::Dry::Struct do
  Types = Dry.Types(default: :nominal)

  it 'has a version number' do
    expect(RSpec::Dry::Struct::VERSION).not_to be nil
  end

  let(:instance) { Class.new.send(:include, described_class).new }

  describe '#have_attribute' do
    subject { instance.have_attribute(:attr) }

    it { is_expected.to be_an_instance_of(RSpec::Dry::Struct::Matcher) }
    its(:attr_name) { is_expected.to eq :attr }
    its(:attr_type) { is_expected.to be_nil }

    context 'with attribute type' do
      subject { instance.have_attribute(:attr, Types::String) }

      its(:attr_type) { is_expected.to eq Types::String }
    end
  end

  describe 'integration test' do
    subject { struct }

    let(:struct) do
      Class.new(Dry::Struct) do
        attribute :first_name, Types::Strict::String
      end
    end

    it { is_expected.to have_attribute(:first_name) }
    it { is_expected.to have_attribute(:first_name, Types::Strict::String) }

    it 'has message on failure' do
      expect { is_expected.to have_attribute(:last_name) }
        .to raise_error(RSpec::Expectations::ExpectationNotMetError)
    end

    it { is_expected.not_to have_attribute(:last_name) }
    it { is_expected.not_to have_attribute(:first_name, Types::Integer) }

    it 'has message on negated failure' do
      expect { is_expected.not_to have_attribute(:first_name) }
        .to raise_error(RSpec::Expectations::ExpectationNotMetError)
    end
  end
end
