class AddToPortfolio < ActiveRecord::Migration
  def change
     add_column :portfolios, :end_date, :datetime
     add_column :portfolios, :start_date, :datetime
     add_column :portfolios, :profile_id, :integer
  end
end
