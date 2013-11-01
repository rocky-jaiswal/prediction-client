module Prediction
  module Client
    
    class User

      attr_reader :id, :name, :location

      def initialize(id, name, location)
        @id = id
        @name = name
        @location = location
      end

      def to_s
        "User: #{@id} / #{@name} / #{@location}"
      end

    end

  end
end