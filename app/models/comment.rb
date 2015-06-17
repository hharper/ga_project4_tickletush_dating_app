class Comment < ActiveRecord::Base
  belongs_to :recommendation
  # validates_presence_of :body
end
