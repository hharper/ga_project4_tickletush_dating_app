class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @recommendation = Recommendation.new
  end

  def show
    @user = current_user
    # @recommendations = Recommendation.all
    # @profile = current_user.profile
    #
    #     redirect_to new_user_profile_path(current_user) unless @profile
  end

  def new
    @user = User.new
  end

  def create
  #   @user = User.new(params[:user])
  #   if @user.save
  #     session[:user_id] = @user.id
  #     flash[:notice] = "Thank you for signing up! You are now logged in."
  #     redirect_to root_url
  #   else
  #     render :action => 'new'
  #   end
  # end

    @profile = current_user.profile
    @profile = Profile.create!(name: params[:name], photo_url: params[:photo_url], city: params[:city], interests: params[:interests], about_me: params[:about_me])
  end


  # def pending_status
  #   @user_recs = []
  #     Recommendation.where(current_user_id == first_match_id).each do |rec|
  #       if rec.status_id == 1 || rec.status_id == 3
  #         @user_recs << rec
  #       end
  #     end
  #       Recommendation.where(current_user_id ==secondMatch_id).each do |rec|
  #         if rec.status_id == 1 || rec.status_id == 2
  #           @user_recs << rec
  #         end
  #       end
  # end



end
