class Artwork < ApplicationRecord
    validates :title, uniqueness: {scope: :artist_id,
    message: "This artist already has an artwork by that name."}, presence: true

    belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

    has_many :shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

    has_many :shared_viewers,
    through: :shares,
    source: :viewer

end