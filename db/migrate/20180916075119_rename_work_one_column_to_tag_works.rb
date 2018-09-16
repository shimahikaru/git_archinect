class RenameWorkOneColumnToTagWorks < ActiveRecord::Migration[5.2]
  def change
        rename_column :tag_works, :work_one, :work1
  end
end
