class User < ApplicationRecord
   validates :username, presence: true, uniqueness: true

   has_many :artworks, dependent: :destroy,
   primary_key: :id,
   foreign_key: :artist_id,
   class_name: :Artwork

   has_many :shares, dependent: :destroy,
   primary_key: :id,
   foreign_key: :viewer_id,
   class_name: :ArtworkShare

   has_many :comments, dependent: :destroy,
   primary_key: :id,
   foreign_key: :commenter_id,
   class_name: :Comment

   has_many :viewed_artworks, #used to be shared_artworks
   through: :shares,
   source: :artwork

   

end