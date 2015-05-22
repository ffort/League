class AlterUsers < ActiveRecord::Migration
  def up
    remove_column("admin_users","summoner_name")
    add_column("admin_users", "username", :string, :limit => 25, :after =>
    "email")
    change_column("admin_users", "email", :string, :limit => 100)
    rename_column("admin_users", "password", "hashed_password")
    puts "**Adding index***"
    add_index("admin_users", "username")
  end

  def down
    remove_index("admin_users", "username")
    rename_column("admin_users","hashed_password" ,"password" )
    change_column("admin_users", "email",  limit: 255, default: "", null: false)
    remove_column("admin_users", "username", :string, :limit => 25, :after =>
        "email")
    add_column("summoner_name","admin_users", limit: 50)



  end
end
