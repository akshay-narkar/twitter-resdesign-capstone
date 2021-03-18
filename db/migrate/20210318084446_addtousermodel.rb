class Addtousermodel < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :text
    add_column :users, :fullname, :text
    add_column :users, :photo, :text
    add_column :users, :coverimage, :text
  end
end
