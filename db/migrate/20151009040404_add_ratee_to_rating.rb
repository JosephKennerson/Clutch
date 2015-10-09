class AddRateeToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :ratee_id, :integer
  end
end
