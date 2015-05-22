class CreateAbilities < ActiveRecord::Migration
  def up
    create_table :abilities do |t|
      t.string   "name"
      t.integer  "cost"
      t.integer  "cooldown"
      t.string   "passive", :default => ""
      t.string   "active", :default => ""
      t.integer  "scope"
      t.string   "ability_type"
      t.string   "description"
      t.string   "imageURL"
      t.integer  "champion_id"

      t.timestamps
    end

    add_index("abilities", "champion_id")

  end

  def down
    drop_table :abilities
  end

end
