class AnswerChoice <ApplicationRecord
    validates :text,:question_id, presence:true
end