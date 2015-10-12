class AddMessageToRsvps < ActiveRecord::Migration
  def change
    add_column :rsvps, :message, :text
  end
end
