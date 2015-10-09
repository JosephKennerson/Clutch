class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :event, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :is_private
      t.text :body

      t.timestamps null: false
    end
  end
end
