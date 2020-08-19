class Album < ApplicationRecord
    validates :title, presence: true
    validates :year, presence: true

    belongs_to :artist,
    foreign_key: :album_id,
    class_name: :Artist
end