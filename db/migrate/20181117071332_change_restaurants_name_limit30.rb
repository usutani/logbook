class ChangeRestaurantsNameLimit30 < ActiveRecord::Migration[5.2]
  def up
    change_column :restaurants, :name, :string, limit: 30
  end
  def down
    change_column :restaurants, :name, :string
  end
end
