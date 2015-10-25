class PortfoliosController < ApplicationController
  before_action :set_profile, only: [:new, :create, :edit, :update]
  before_action :set_portfolio, except: [:index, :new, :create]
  def index
    @portfolios = Portfolio.all
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_with(@portfolio)
    respond_to do |format|
      format.html
    end
  end

  def new
    @portfolio = Portfolio.new
    @image = @portfolio.image || @portfolio.build_image
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    @portfolio = @profile.portfolios.new(portfolio_params)
    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to root_path, notice: 'Portfolio was created.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @portfolio.update(portfolio_params)
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html
    end
  end

  private
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    def set_profile
      @profile = Profile.find_by_id(params[:profile_id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:title, :description, :image_url, :client, :services, image_attributes: [:photo])
    end
end
