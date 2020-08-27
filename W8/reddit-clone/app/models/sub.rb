class Sub < ApplicationRecord

    validates :title, presence: true, uniqueness:true
    validates :description, presence: true
    validates :moderator_id, presence: true

    belongs_to :moderator,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: :User

    has_many :sub_posts,
    foreign_key: :sub_id,
    class_name: :SubPost,
    inverse_of: :sub

    has_many :posts,
    through: :sub_posts,
    source: :post
end
