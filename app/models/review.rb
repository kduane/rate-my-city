class Review < ApplicationRecord
  validates :body, presence: true
  belongs_to :city

  after_save :new_vote, :calculate_rating

  def new_vote
    vote = Vote.new(score: self.rating)
    vote.save
  end

  def calculate_rating
    cityvotes = Review.where(city_id: city_id)
    total_score = 0
    cityvotes.each do |vote|
      total_score += vote.rating
    end
    # binding.pry
    city.rating = (total_score / (cityvotes.length == 0 ? 1 : cityvotes.length)).to_i
    city.save
  end

end
