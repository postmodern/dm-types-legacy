require 'dm-core'

require 'date'

module DataMapper
  class Property
    module Legacy
      class DateString < String

        #
        # Parses a date string.
        #
        # @param [String] value
        #   The date string.
        #
        # @return [Date, nil]
        #   The parsed date.
        #
        def load(value)
          Date.parse(value) unless (value.nil? || value.empty?)
        end

        #
        # Typecasts a date.
        #
        # @param [Date, Time, String, nil] value
        #   The date to typecast.
        #
        # @return [Date, nil]
        #   The typecasted date.
        #
        def typecast(value)
          if value.kind_of?(Date)
            value
          elsif value.kind_of?(Time)
            value.to_date
          elsif value.kind_of?(String)
            Date.parse(value) unless value.empty?
          end
        end

        #
        # Dumps a date to a string.
        #
        # @param [Date, nil] value
        #   The date to dump.
        #
        # @return [String, nil]
        #   The date string.
        #
        def dump(value)
          value.to_s unless value.nil?
        end

      end
    end
  end
end
