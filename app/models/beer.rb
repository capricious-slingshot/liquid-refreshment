class Beer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  has_many :opinions
  has_many :users, through: :opinions

  def not_rated?(user_id)
    self.opinions.find_by(user_id: user_id).nil?
  end

  def slug
    self.name.downcase.gsub(/\W+/, '-')
  end

  def self.find_by_slug(slug)
    Beer.all.find {|i| i.slug == slug}
  end
end
