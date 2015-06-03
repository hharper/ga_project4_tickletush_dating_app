class Recommendation < ActiveRecord::Base
  STATUS = {
    neither: 1,
    first_match_accepted: 2,
    second_match_accepted: 3,
    both_accepted: 4,
    declined: 5
  }

  def accept_first_match
    update_column(:status_id, STATUS[:first_match_accepted])
  end

  def accept_second_match
    update_column(:status_id, STATUS[:second_match_accepted])
  end

  def decline
    update_column(:status_id, STATUS[:declined])
    # @recommendation.destroy
  end

  belongs_to :user
  # belongs_to :recommended, :class_name => "User"
  # belongs_to :firstMatch, :class_name => "User"
  # belongs_to :secondMatch, :class_name => "User"

  has_many :comments
end
