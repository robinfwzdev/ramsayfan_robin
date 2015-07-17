class AddApprovedToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :approved, :boolean, default: :false
  end
end
