class Beer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :users
  has_many :users, through: :opinions
end
