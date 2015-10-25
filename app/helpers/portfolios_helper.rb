module PortfoliosHelper
   def portfolio_image(portfolio)
    portfolio.image.try(:photo).present? ? portfolio.image.photo.url : "no-portfolio.png"
  end
end
