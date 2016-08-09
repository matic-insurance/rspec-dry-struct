module RSpec
  module Dry
    module Struct
      class Matcher
        attr_reader :attr_name, :attr_type

        def initialize(attr_name, attr_type)
          @attr_name = attr_name
          @attr_type = attr_type
        end

        def matches?(actual)
          actual.schema[@attr_name] == @attr_type
        end
      end
    end
  end
end
