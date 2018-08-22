class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :description
      t.integer :region_id

      t.timestamps
    end
  end
end
