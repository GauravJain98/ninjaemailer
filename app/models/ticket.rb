class Ticket < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates:email, presence:true
end
