require 'dm-core'

require 'cgi'

module DataMapper
  class Property
    module Legacy
      class HTMLText < Text

        #
        # Unescaped HTML escaped data.
        #
        # @param [String, nil] value
        #   The HTML escaped data.
        #
        # @return [String, nil]
        #   The HTML unescaped data.
        #
        def load(value)
          CGI.unescape_html(value) unless value.nil?
        end

        #
        # HTML escapes data.
        #
        # @param [String, nil] value
        #   The raw data.
        #
        # @return [String, nil]
        #   The HTML escaped data.
        #
        def dump(value)
          CGI.escape_html(value) unless value.nil?
        end

      end
    end
  end
end
