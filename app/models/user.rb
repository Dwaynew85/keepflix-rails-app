class User < ApplicationRecord
    has_secure_password
    has_many :users_movies
    has_many :movies, through: :users_movies
    has_many :comments, dependent: :destroy

    validates :name, :email, presence: {message: "Email required"}
    validates :email, uniqueness: {message: "User email in use. Please log in with email or use another."}

    after_initialize :default

    def default
        if !self.pic_url?
            self.pic_url = 'https://image.freepik.com/free-photo/black-shade-anatomy-blue-wireframe-face-front-view-dark-background_48049-5.jpg'
        end
    end



    def self.find_or_create_by_omniauth(auth_hash)
        if auth_hash["info"]["email"]
            self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
                user.password = SecureRandom.hex
            end
        else
            self.new(name: auth_hash[:info][:name], password: SecureRandom.hex)
        end
    end
end
