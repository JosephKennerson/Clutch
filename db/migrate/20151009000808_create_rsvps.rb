class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.boolean :pending
      t.boolean :confirmed

      t.timestamps null: false
    end
  end
end
