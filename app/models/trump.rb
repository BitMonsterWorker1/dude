class Trump < ApplicationRecord
   belongs_to :user
   validates :title, length: {minimum: 3}
   validates :body, length: {minimum: 5}
end
