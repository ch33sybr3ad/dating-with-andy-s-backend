class AddStuffToUsers < ActiveRecord::Migration
  def change
    add_column :users, :eye_color, :string
    add_column :users, :height, :integer
    add_column :users, :gender, :string
    add_column :users, :looking_for, :string
    add_column :users, :ethnicity, :string
    add_column :users, :zip_code, :integer
    add_column :users, :location, :string
  end
end
