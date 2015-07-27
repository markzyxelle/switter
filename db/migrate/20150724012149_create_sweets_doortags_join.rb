class CreateSweetsDoortagsJoin < ActiveRecord::Migration
  def change
    create_table :sweets_doortags, :id => false  do |t|
    	t.integer "sweet_id"
    	t.integer "doortag_id"
    end
    add_index :sweets_doortags, ["sweet_id", "doortag_id"]
  end
end
