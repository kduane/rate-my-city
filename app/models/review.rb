class Review < ApplicationRecord
  validates :body, presence: true
  belongs_to :city

  after_save :calculate_rating

end
