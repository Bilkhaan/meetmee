json.array!(@portfolios) do |portfolio|
  json.extract! portfolio, :id, :title, :description, :image_url, :client, :services
  json.url portfolio_url(portfolio, format: :json)
end
