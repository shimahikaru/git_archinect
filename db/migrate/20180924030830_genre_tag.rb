class GenreTag < ActiveRecord::Migration[5.2]
  def change
   drop_table :genre_tags
  end
end
