class Opinion < ActiveRecord::Base
  validates :user_id, presence: true
  validates :beer_id, presence: true
  belongs_to :beer
  belongs_to :user
end
