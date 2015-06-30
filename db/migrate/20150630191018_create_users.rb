class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :user_image
      t.integer :age
      t.text :bio

      t.timestamps null: false
    end
  end
end
