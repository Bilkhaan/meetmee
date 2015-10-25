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
    @image = @profile.image || @profile.build_image
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to dashboard_home_path(id: @profile.user_name), notice: "succesfully created"
    else
      respond_to do |format|
        format.html
      end
    end
  end

  def update
    @profile.update(profile_params)
    if @profile.save
      redirect_to dashboard_home_path(id: @profile.user_name), notice: "succesfully created"
    else
      respond_to do |format|
        format.html
      end
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
      params.require(:profile).permit(:name, :about_me, :age, :education, image_attributes: [:photo])
    end
end
