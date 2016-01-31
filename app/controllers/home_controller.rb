class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:user_profile]
  before_action :set_profile, only: [:dashboard, :user_profile]

  def dashboard
    respond_to do |format|
      format.html
    end
  end

  def user_profile
    respond_to do |format|
      format.html
    end
  end

  private
    def set_profile
      name = params[:id] ? params[:id] : current_user.user_name
      @profile = Profile.find_by_user_name(name)
      redirect_to new_profile_path if @profile.blank?
    end
end
