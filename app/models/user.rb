class User < ApplicationRecord
    # class_attribute :pic_url, default: 'https://image.freepik.com/free-photo/black-shade-anatomy-blue-wireframe-face-front-view-dark-background_48049-5.jpg'
    has_secure_password
    has_many :movies
    has_many :comments, through: :movies
    has_many :comments, dependent: :destroy

    validates :name, :email, presence: {message: "Email required"}
    validates :email, uniqueness: {message: "User email in use. Please log in with email or use another."}

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end
end
