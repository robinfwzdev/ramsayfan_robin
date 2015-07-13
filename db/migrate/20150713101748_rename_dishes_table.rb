class RenameDishesTable < ActiveRecord::Migration
  def self.up
    rename_table :dishes_tables, :dishes
  end 
  def self.down
    rename_table :dishes, :dishes_tables
  end
end
