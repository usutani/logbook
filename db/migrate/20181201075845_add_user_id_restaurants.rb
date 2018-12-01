class AddUserIdRestaurants < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM restaurants;'
    add_reference :restaurants, :user, null: false, index: true
  end

  def down
    remove_reference :restaurants, :user, index: true
  end
end
