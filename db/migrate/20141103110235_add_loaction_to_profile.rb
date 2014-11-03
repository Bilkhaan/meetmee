class AddLoactionToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :location, :string
    add_column :profiles, :email_address, :string
  end
end
