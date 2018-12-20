class City < ApplicationRecord
  validates :city_name, presence: true
  validates :description, presence: true

  has_many :reviews

end
