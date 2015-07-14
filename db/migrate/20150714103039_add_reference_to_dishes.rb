class AddReferenceToDishes < ActiveRecord::Migration
  def change
   add_reference :dishes, :fan, index: true
  end
end
