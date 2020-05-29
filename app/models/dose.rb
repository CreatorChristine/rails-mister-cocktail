class Dose < ApplicationRecord
    belongs_to :cocktail
    belongs_to :ingredient

    validates :description, presence: true
    validates :cocktail_id, presence: true, uniqueness: { scope: :cocktail }

    def full_description
        self.description + " " + self.ingredient.name
    end
end
