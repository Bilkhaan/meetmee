class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :about_me
      t.integer :age
      t.text :education

      t.timestamps
    end
  end
end
