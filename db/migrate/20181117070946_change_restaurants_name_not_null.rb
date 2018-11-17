class ChangeRestaurantsNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :restaurants, :name, false
  end
end
