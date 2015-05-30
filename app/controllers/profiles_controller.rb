class ProfilesController < ApplicationController

  def new
    @profile = current_user.build_profile()
  end

  def create
    @profile = current_user.create_profile!(profile_params)
    # redirect_to("users/show")
    redirect_to session[:previous_url] || root_url
  end

  def edit
    @profile = Profile.find_by(params[:current_user])
  end

  def update
    # @profile = current_user.profile.update(profile_params)
    @profile = current_user.profile.update_attributes(profile_params)
    redirect_to("/users/show")
  end

  private
  def profile_params
    params[:profile].permit(:name, :photo_url, :city, :interests, :about_me)
  end

end
