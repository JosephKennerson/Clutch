class SetEventStatusDefault < ActiveRecord::Migration
  def change
    change_column :events, :status, :boolean, default: true
  end
end
