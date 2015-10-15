class CreateGeojsonBuilders < ActiveRecord::Migration
  def change
    create_table :geojson_builders do |t|

      t.timestamps null: false
    end
  end
end
