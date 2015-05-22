class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string   "name"
      t.integer  "cost"
      t.string   "passive", :default => ""
      t.string   "active", :default => ""
      t.string   "description"
      t.string   "imageURL"

      t.timestamps null: false
    end



  end

  def down
    drop_table :items
  end
end
