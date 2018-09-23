class AddGenreToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :genre, :string,  null: true
  end
end
