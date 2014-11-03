class CreateContactMes < ActiveRecord::Migration
  def change
    create_table :contact_mes do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.text :message

      t.timestamps
    end
  end
end
