require 'spec_helper'

RSpec.describe RSpec::Dry::Struct::Matcher do
  Types = Dry::Types.module

  let(:attr_name) { :first_name }
  let(:attr_type) { Types::Strict::String }

  let(:struct_class) do
    Class.new(Dry::Types::Struct) do
      attribute :first_name, Types::Strict::String
    end
  end

  let(:matcher) { described_class.new(attr_name, attr_type) }

  subject { matcher }

  context 'with matching attr_name and type' do
    it 'matches' do
      expect(subject.matches?(struct_class)).to eq true
    end
  end

  context 'with wrong attr_name' do
    let(:attr_name) { :last_name }

    it 'fails' do
      expect(subject.matches?(struct_class)).to eq false
      expect(subject.failure_message)
        .to eq "expected #{struct_class} to have :last_name attribute, but it was not found"
    end
  end

  context 'with wrong type' do
    let(:attr_type) { Types::String }

    it 'fails' do
      expect(subject.matches?(struct_class)).to eq false
      expect(subject.failure_message)
        .to eq "expected #{struct_class} to have :first_name attribute, but type is wrong"
    end
  end

  it 'returns description' do
    expect(subject.description).to eq 'have :first_name attribute'
  end
end
