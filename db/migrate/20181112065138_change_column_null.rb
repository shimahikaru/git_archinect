class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :users, :location, true
  end

  def down
    change_column_null :users, :location, false
  end
end
