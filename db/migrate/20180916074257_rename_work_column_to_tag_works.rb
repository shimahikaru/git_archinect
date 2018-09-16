class RenameWorkColumnToTagWorks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tag_works, :work, :work_one
  end
end
