class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :amount_in_kopecks, default: 0
      t.integer :status, default: 0

      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
