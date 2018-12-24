class Review < ApplicationRecord
  validates :body, presence: true
  belongs_to :city

  after_save :new_vote, :calculate_rating

  def new_vote
    vote = Vote.new(score: self.rating)
    vote.save
  end

  def calculate_rating
    binding.pry
    cityvotes = Votes.where(self.city_id) || 1
    total_score = 0
    cityvotes.each do |vote|
      total_score += vote.score
    end
    binding.pry
    self.city_id.rating = total_score / cityvotes.length * 100
    self.city_id.update
  end

end
