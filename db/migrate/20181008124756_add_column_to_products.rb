class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :impressions_count, :integer, default: 0
  end
end
