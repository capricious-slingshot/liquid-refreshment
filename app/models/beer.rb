class Beer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  has_many :opinions
  has_many :users, through: :opinions
end
