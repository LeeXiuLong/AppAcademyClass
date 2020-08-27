class Post < ApplicationRecord

    has_many :sub_posts,
    foreign_key: :post_id,
    class_name: :SubPost,
    inverse_of: :post

    has_many :subs,
    through: :sub_posts,
    source: :sub

end
