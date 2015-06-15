class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable,:omniauth_providers => [:facebook]

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name...CHANGE THIS TO PROFILE
      user.image = auth.info.image # assuming the user model has an image...CHANGE THIS TO PROFILE
      user.create_profile!(name: auth.info.name, photo_url: auth.info.image)
      # profile.photo_url = auth.info.image
      # profile.name = auth.info.name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end



  def recommended_as_match
    Recommendation.where('first_match_id = :user_id OR second_match_id = :user_id', user_id: self)
    #query DB for all recommendations where I as user have been recommended as a potential match
  end

  def matched_recommendations
    Recommendation.where('(first_match_id = :user_id OR second_match_id = :user_id) AND status_id = 4', user_id: self)
    #query DB for all recommendations where I as user have been recommended as a potential match AND both matches have accepted the match
  end


end
