require "date"

class Cat < ApplicationRecord
    COLORS = %w(black white brown gray orange)

    validates :color, inclusion: {in: COLORS}
    validates :sex, inclusion: {in: %w(M F)}
    validates :color, :birthdate, :name, :sex, presence: true

    def age
        birth_year = self.birthdate.year
        birth_month = self.birthdate.month
        birth_day = self.birthdate.day
        current_age = -1
        if birth_month <= Time.now.month
            if birth_day <= Time.now.day
                current_age = 0
            end
        end
        current_age += Time.now.year - birth_year

    end
end
