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
      @profile = params[:id].present? ? Profile.find_by_user_name(params[:id]) : current_user.profile
      redirect_to  root_path, alert: 'Invalid url' if @profile.blank?
    end
end
