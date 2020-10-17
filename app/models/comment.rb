class Comment < ApplicationRecord
    belongs_to :movie
    belongs_to :user 
    validates :content, :presence => true

    def my_time
        self.updated_at.strftime("%a, %b %d %Y %I:%M%p")
    end
end
