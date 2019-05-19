class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: { message: 'Password can\'t be blank' }
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: { minimum: 8, allow_nil: true }
    after_initialize :ensure_session_token
    attr_accessor :password

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return unless user
        user.is_password?(password) ? user : nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
end