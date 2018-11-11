class AddColumnToWholePhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :whole_photos, :title, :text
    add_column :whole_photos, :text, :text
  end
end
