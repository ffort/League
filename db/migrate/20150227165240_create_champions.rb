class CreateChampions < ActiveRecord::Migration
  def up
    create_table :champions do |t|
      t.string "champion_name"
      t.string "primary_role"
      t.string "secondary_role", :default => ""
      t.string "damage_type"
      t.timestamps null: false
    end
  end

  def down
    drop_table :users
  end

end
