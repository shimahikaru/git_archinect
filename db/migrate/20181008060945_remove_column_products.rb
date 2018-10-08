class RemoveColumnProducts < ActiveRecord::Migration[5.2]
  def change
      remove_column :Products, :location2
  end
end
