class Review < ApplicationRecord
  validates :body, presence: true
  belongs_to :city

  after_save :new_vote

  def new_vote
    Vote.new(score: self.rating)
  end

end
