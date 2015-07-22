class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :followers
      t.integer :following
      t.integer :sweets

      t.timestamps null: false
    end
  end
end
