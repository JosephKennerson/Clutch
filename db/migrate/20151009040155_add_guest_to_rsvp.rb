class AddGuestToRsvp < ActiveRecord::Migration
  def change
    add_column :rsvps, :guest_id, :integer
  end
end
