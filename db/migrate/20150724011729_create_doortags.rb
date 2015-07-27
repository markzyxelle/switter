class CreateDoortags < ActiveRecord::Migration
  def change
    create_table :doortags do |t|
      t.text :tag

      t.timestamps null: false
    end
  end
end
