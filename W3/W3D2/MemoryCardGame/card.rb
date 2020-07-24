class Card
    attr_reader :face_up

    def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end

    def face_value
        return @face_value if self.face_up
        nil 
    end

    def reveal
        @face_up = true
    end

    def hide
        @face_up = false
    end

    def to_s
        return "#{@face_value} " if self.face_up
        "? "
    end

    def ==(card_instance)
        if card_instance.kind_of?(Card)
            @face_value == card_instance.face_value
        else
            false
        end
    end
end