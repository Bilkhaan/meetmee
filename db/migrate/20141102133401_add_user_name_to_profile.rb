class AddUserNameToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :user_name, :string
    add_column :profiles, :user_id, :integer
  end
end
