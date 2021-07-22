class Tile
    attr_reader :value
    def initialize(value="_")
        @value = value
    end

    def to_s
        @value.to_s
    end

end