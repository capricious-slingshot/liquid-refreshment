class Opinion < ActiveRecord::Base
  validates :user_id, presence: true
  validates :beer_id, presence: true
  belongs_to :beers
  belongs_to :users
end
