class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :item_type, null: false
      t.string :image, null: false
      t.decimal :latitude, null: false, precision: 10, scale: 6
      t.decimal :longitude, null: false, precision: 10, scale: 6
      t.datetime :schedule
      t.integer :city_id, null: false

      t.timestamps
    end
  end
end
