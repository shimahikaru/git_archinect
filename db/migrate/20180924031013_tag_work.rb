class TagWork < ActiveRecord::Migration[5.2]
  def change
    drop_table :tag_works
  end
end
