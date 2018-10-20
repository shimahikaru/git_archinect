class AddChargeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :charge, :integer
  end
end
