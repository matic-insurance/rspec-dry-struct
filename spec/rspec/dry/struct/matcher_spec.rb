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

    it 'does not match' do
      expect(subject.matches?(struct_class)).to eq false
    end
  end

  context 'with wrong type' do
    let(:attr_type) { Types::String }

    it 'does not match' do
      expect(subject.matches?(struct_class)).to eq false
    end
  end
end
