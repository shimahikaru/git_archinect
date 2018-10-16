class RenameTypeColumnToNotices < ActiveRecord::Migration[5.2]
  def change
    rename_column :notices, :type, :category
  end
end
