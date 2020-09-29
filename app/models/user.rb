class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, :message => "Email required"
    validates :email, uniqueness: true, :message => "User email in use. Please log in with email or use another."

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end
end
