class CreateCoins < ActiveRecord::Migration
  def change
    create_table :coins do |t|
      t.decimal :value
      t.belongs_to :user, index: true
      t.belongs_to :chest, index: true
      t.belongs_to :category, index: true
      t.boolean :is_recurrent
      t.date :repeat_until
      t.integer :period

      t.timestamps
    end
  end
end
