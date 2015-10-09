class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :photo
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
