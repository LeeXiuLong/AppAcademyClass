class Like < ApplicationRecord
    validates :user_id, uniqueness: {scope: :likeable, 
        message: "You can only like something once"}, presence: true

    belongs_to :likeable, polymorphic: true

    belongs_to :liker,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User


end