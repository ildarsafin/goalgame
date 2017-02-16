class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.integer :coins, default: 0

      t.references :user, null: false, foreign_key: true, index: true
    end
  end
end
