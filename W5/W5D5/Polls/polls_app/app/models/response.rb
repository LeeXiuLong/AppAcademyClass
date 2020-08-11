class Response < ApplicationRecord
    validates :user_id, :answer_choice_id, presence_true
end