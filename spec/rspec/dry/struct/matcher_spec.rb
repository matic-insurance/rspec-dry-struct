require 'spec_helper'

RSpec.describe RSpec::Dry::Struct::Matcher do
  Types = Dry::Types.module

  subject { matcher }

  let(:attr_name) { :first_name }

  let(:struct_class) do
    Class.new(Dry::Types::Struct) do
      attribute :first_name, Types::Strict::String
    end
  end

  let(:matcher) { described_class.new(attr_name) }

  context 'with matching attr_name and type' do
    it 'matches' do
      expect(matcher.matches?(struct_class)).to eq true
    end
  end

  context 'with wrong attr_name' do
    let(:attr_name) { :last_name }

    it 'fails' do
      expect(matcher.matches?(struct_class)).to eq false
    end

    it 'contains failure message' do
      matcher.matches?(struct_class)
      expect(matcher.failure_message)
        .to eq "expected #{struct_class} to have :last_name attribute, but it was not found"
    end
  end

  context 'with specific type' do
    let(:attr_type) { Types::Strict::String }
    let(:matcher) { described_class.new(attr_name, attr_type) }

    context 'with matching attr_name and type' do
      it 'matches' do
        expect(matcher.matches?(struct_class)).to eq true
      end
    end

    context 'with wrong type' do
      let(:attr_type) { Types::String }

      it 'fails' do
        expect(matcher.matches?(struct_class)).to eq false
      end

      it 'contains failure message' do
        matcher.matches?(struct_class)
        expect(matcher.failure_message)
          .to eq "expected #{struct_class} to have :first_name attribute, but type is wrong"
      end
    end
  end

  it 'returns description' do
    expect(matcher.description).to eq 'have :first_name attribute'
  end
end
