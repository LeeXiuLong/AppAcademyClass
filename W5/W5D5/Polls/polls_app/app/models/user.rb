class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true


    has_many :responses,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Response

    has_many :authors,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Poll

    
end