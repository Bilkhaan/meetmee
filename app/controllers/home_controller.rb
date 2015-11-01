class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:dashboard]

  def dashboard
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
