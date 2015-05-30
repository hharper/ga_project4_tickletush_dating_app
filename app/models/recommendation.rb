class Recommendation < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :matchOne, :presence => true
  validates :matchTwo, :presence => true
end
