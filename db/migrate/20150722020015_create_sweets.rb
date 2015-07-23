class CreateSweets < ActiveRecord::Migration
  def change
    create_table :sweets do |t|
      t.integer :user_id
      t.integer :parent_id
      t.text :message

      t.timestamps null: false
    end
  end
end
