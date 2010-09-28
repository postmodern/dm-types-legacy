module DataMapper
  class Property
    module Legacy
      class NumericIPAddr < Integer

        #
        # Loads a numeric IP Address.
        #
        # @param [Integer, nil] value
        #   The numeric IP Address.
        #
        # @return [IPAddr, nil]
        #   The IP Address.
        #
        def load(value)
          load_integer(value) unless value.nil?
        end

        #
        # Typecasts an IP Address.
        #
        # @param [IPAddr, String, Integer, nil] value
        #   The IP Address.
        #
        # @return [IPAddr, nil]
        #   The typecasted IP Address.
        #
        def typecast(value)
          if value.kind_of?(IPAddr)
            value
          elsif value.kind_of?(String)
            IPAddr.new(value) unless value.empty?
          elsif value.kind_of?(Integer)
            load_integer(value)
          end
        end

        #
        # Dumps an IP Address to a numreic value.
        #
        # @param [IPAddr, nil] value
        #   The IP Address.
        #
        # @return [Integer, nil]
        #   The numeric IP Address.
        #
        def dump(value)
          value.to_i unless value.nil?
        end

        protected

        #
        # Loads an IPv4 or IPv6 address from an integer.
        #
        # @param [Integer] value
        #   The numeric IP Address.
        #
        # @return [IPAddr]
        #   The IPv4 or IPv6 address.
        #
        def load_integer(value)
          if value > 4294967295 # (2 ** 32) - 1
            IPAddr.new(value,Socket::AF_INET6)
          else
            IPAddr.new(value,Socket::AF_INET)
          end
        end

      end
    end
  end
end
