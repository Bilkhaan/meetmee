class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

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
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      format.html { redirect_to @guess, notice: 'Can You Guess was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: 'edit' }
      format.json { render json: @guess.errors, status: :unprocessable_entity }
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

    def portfolio_params
      params.require(:portfolio).permit(:title, :description, :image_url, :client, :services)
    end
end
