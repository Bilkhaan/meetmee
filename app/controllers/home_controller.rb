class HomeController < ApplicationController
  before_action :set_profile, only: [:dashboard]

  def dashboard
    respond_to do |format|
      format.html
    end
  end

  private
    def set_profile
      @profile = Profile.find_by_user_name(params[:id])
    end
end
