class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :url
      t.text :note

      t.timestamps
    end
  end
end
