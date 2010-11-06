require 'dm-core'

require 'time'
require 'date'

module DataMapper
  class Property
    module Legacy
      class TimeString < String

        #
        # Parses a time string.
        #
        # @param [String] value
        #   The time string.
        #
        # @return [Time, nil]
        #   The parsed time.
        #
        def load(value)
          ::Time.parse(value) unless (value.nil? || value.empty?)
        end

        #
        # Typecasts a time.
        #
        # @param [Time, Date, String, nil] value
        #   The time to typecast.
        #
        # @return [Time, nil]
        #   The typecasted time.
        #
        def typecast(value)
          if value.kind_of?(::Time)
            value
          elsif value.kind_of?(::Date)
            value.to_time
          elsif value.kind_of?(::String)
            ::Time.parse(value) unless value.empty?
          end
        end

        #
        # Dumps a time to a string.
        #
        # @param [Time, nil] value
        #   The time to dump.
        #
        # @return [String, nil]
        #   The time string.
        #
        def dump(value)
          case value
          when ::Time
            value.to_s
          when ::Date
            value.to_time.to_s
          when nil
            nil
          else
            value.to_s
          end
        end

      end
    end
  end
end
