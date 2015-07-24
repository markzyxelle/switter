class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.belongs_to :user, index: true
      t.belongs_to :sweet, index: true
      t.boolean :comment

      t.timestamps null: false
    end
  end
end
