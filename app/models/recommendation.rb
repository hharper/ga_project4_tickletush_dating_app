class Recommendation < ActiveRecord::Base
  STATUS = {
    neither: 1,
    firstMatchAccepted: 2,
    secondMatchAccepted: 3,
    bothAccepted: 4,
    declined: 5
  }

  def accept_first_match
    update_column(status_id, STATUS[:firstMatchAccepted])
  end

  def accept_second_match
    update_column(status_id, STATUS[:secondMatchAccepted])
  end

  def decline
    # update_column(status_id, STATUS[:declined])
    @recommendation.destroy
  end

  belongs_to :user
  # belongs_to :recommended, :class_name => "User"
  # belongs_to :firstMatch, :class_name => "User"
  # belongs_to :secondMatch, :class_name => "User"

  has_many :comments
end
