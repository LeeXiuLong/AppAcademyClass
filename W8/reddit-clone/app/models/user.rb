class User < ApplicationRecord

    validates :username, uniqueness:true, presence: true
    validates :session_token, presence: true
    validates :password_digest, presence: true, uniqueness:true
    validates :password, length: {minimum: 6, allow_nil:true}

    has_many :posts,    
        primary_key: :id,
        foreign_key: :author_id,
        class_name: 'Post'
    
    has_many :subs,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: 'Sub'

    before_validation :ensure_session_token

    attr_reader :password

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user && user.is_password?(password)
        user
    end

    def is_password?(password)
        b = BCrypt::Password.new(self.password_digest)
        b.is_password?(password)
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    private

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end
end
