class AddColumnProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :Products, :charge, :integer, null: true
  end
end
