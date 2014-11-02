class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :client
      t.string :services

      t.timestamps
    end
  end
end
