class AddRaterToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :rater_id, :integer
  end
end
