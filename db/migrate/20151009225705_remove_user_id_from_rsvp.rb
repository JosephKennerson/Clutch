class RemoveUserIdFromRsvp < ActiveRecord::Migration
  def change
    remove_column :rsvps, :user_id, :reference
  end
end
