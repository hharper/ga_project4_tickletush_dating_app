class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :omniauthable, :omniauth_providers => [:facebook]
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :recommendations
  # has_many :recommendeds, :through => :recommendations
  # has_many :inverse_recommendations, :class_name => "Recommendation", :foreign_key => "recommended_id"
  # has_many :inverse_recommendeds, :through => :inverse_recommendations, :source => :user

  # has_many :recommendations
  # has_many :firstMatched_recommendations, :class_name => "Recommendation", :foreign_key => "first_match_id"
  # has_many :inverse_firstMatched_recommendations, :class_name => "Recommendation", :foreign_key => "first_match_id"
  # has_many :secondMatched_recommendations, :class_name => "Recommendation", :foreign_key => "secondMatch_id"
  # has_many :inverse_secondMatched_recommendations, :class_name => "Recommendation", :foreign_key => "secondMatch_id"


  has_one :profile, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def recommended_as_match
    Recommendation.where('first_match_id = :user_id OR second_match_id = :user_id', user_id: self)
    #query DB for all recommendations where I as user have been recommended as a potential match
  end

  def matched_recommendations
    Recommendation.where('(first_match_id = :user_id OR second_match_id = :user_id) AND status_id = 4', user_id: self)
    #query DB for all recommendations where I as user have been recommended as a potential match AND both matches have accepted the match
  end


end
