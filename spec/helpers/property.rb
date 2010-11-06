module Helpers
  module Property
    class ::Model
      include DataMapper::Resource

      property :id, Serial
    end

    def property(property_class)
      @property = property_class.new(::Model,:legacy)
    end
  end
end
