class AddsParentIdToCoin < ActiveRecord::Migration
  def up
    add_column :coins, :parent_id, :integer
    add_index :coins, :parent_id
  end

  def down
    remove_column :coins, :parent_id
    remove_index :coins, :parent_id
  end
end
