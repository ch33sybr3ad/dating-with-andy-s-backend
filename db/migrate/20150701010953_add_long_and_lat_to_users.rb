class AddLongAndLatToUsers < ActiveRecord::Migration
  def change
    add_column :users, :long, :integer
    add_column :users, :lat, :integer
  end
end
