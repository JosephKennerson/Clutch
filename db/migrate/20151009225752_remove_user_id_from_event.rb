class RemoveUserIdFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :user_id, :reference
  end
end
