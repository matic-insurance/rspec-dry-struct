require 'rspec/core'
require 'dry/types'
require 'rspec/dry/struct/version'
require 'rspec/dry/struct/matcher'

module RSpec
  module Dry
    module Struct
      def have_attribute(name, type = nil) # rubocop:disable Style/PredicateName
        Matcher.new(name, type)
      end
    end
  end
end

RSpec.configure do |config|
  config.include RSpec::Dry::Struct
end
