class CreateDishesTable < ActiveRecord::Migration
  def change
    create_table :dishes_tables do |t|
      t.string  :title
      t.text    :description
      t.decimal :cost, precision: 8, scale: 2
      t.integer :pax
      t.boolean :vegetarian

      t.timestamps
    end
  end
end
