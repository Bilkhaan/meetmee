class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def new
    @profile = Profile.new
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    respond_to do |format|
      format.html
    end
  end

  def update
    @profile.update(profile_params)
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html
    end
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:name, :about_me, :age, :education)
    end
end
