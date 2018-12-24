class Vote < ApplicationRecord
  belongs_to :city
  belongs_to :review

  after_save :calculate_rating

  def calculate_rating
    cityvotes = Vote.where(self.city_id)
    total_score = 0
    cityvotes.each do |vote|
      total_score += vote.score
    end
    binding.pry
    self.city_id.rating = total_score / cityvotes.length * 100
    self.city_id.update
  end

end
