class Vote < ApplicationRecord
  belongs_to :users
  belongs_to :reviews
end
