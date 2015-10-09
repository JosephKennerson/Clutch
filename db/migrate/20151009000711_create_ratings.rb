class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :event, index: true, foreign_key: true
      t.float :rating
      t.text :rating_feedback
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
