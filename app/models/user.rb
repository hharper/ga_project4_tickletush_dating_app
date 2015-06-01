class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :omniauthable, :omniauth_providers => [:facebook]
    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user

    has_many :recommendations
    has_one :profile, dependent: :destroy
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



end
