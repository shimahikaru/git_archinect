class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :comments_count, :integer, null: false, default: 0
  end
end
