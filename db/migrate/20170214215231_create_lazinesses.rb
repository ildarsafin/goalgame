class CreateLazinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :lazinesses do |t|
      t.integer :points, default: 0

      t.references :user, null: false, foreign_key: true, index: true
    end
  end
end
