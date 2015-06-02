class Recommendation < ActiveRecord::Base
  belongs_to :user
  # belongs_to :recommended, :class_name => "User"
  # belongs_to :firstMatch, :class_name => "User"
  # belongs_to :secondMatch, :class_name => "User"

  has_many :comments
end
