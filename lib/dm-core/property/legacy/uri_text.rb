require 'dm-core'

require 'uri'

module DataMapper
  class Property
    module Legacy
      class URIText < Text

        #
        # Unescaped URI escaped data.
        #
        # @param [String, nil] value
        #   The URI escaped data.
        #
        # @return [String, nil]
        #   The URI unescaped data.
        #
        def load(value)
          URI.unescape(value) unless value.nil?
        end

        #
        # URI escapes data.
        #
        # @param [String, nil] value
        #   The raw data.
        #
        # @return [String, nil]
        #   The URI escaped data.
        #
        def dump(value)
          URI.escape(value) unless value.nil?
        end

      end
    end
  end
end
