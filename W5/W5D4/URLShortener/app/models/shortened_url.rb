class ShortenedURL < ApplicationRecord
    validates :short_url, :long_url, :user_id, presence: true, uniqueness: true
end