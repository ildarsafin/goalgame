class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.text :description, null: false

      t.datetime  :start_at, null: false
      t.datetime  :planned_end_at, null: false
      t.datetime  :actually_end_at

      t.integer :status, default: 0
      t.integer :activity_area, default: 0

      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
