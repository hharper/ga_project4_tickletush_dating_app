class Recommendation < ActiveRecord::Base
  belongs_to :user
  belongs_to :recommended, :class_name => "User"
  has_many :comments
  # validates :matchOne, :presence => true
  # validates :matchTwo, :presence => true
end
