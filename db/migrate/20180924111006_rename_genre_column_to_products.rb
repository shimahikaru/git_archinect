class RenameGenreColumnToProducts < ActiveRecord::Migration[5.2]
  def change
   rename_column :products, :genre, :category
  end
end
