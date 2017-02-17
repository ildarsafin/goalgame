class AddTinkoffRebillIdToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :tinkoff_rebill_id, :string

    add_index(:accounts, :tinkoff_rebill_id)
  end
end
