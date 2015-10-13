class RemoveUserIdFromRating < ActiveRecord::Migration
  def change
    remove_column :ratings, :user_id, :reference
  end
end
