class Contact < ApplicationRecord
  
  validates :email, presence: true, uniqueness: true
  belongs_to :user2
end
