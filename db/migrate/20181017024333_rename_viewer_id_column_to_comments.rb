class RenameViewerIdColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :viewer_id, :notice_id
  end
end
