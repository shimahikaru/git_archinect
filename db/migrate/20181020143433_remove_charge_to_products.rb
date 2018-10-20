class RemoveChargeToProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :charge, :integer
  end
end
