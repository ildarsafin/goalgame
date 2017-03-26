class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.text :description, null: false
      t.integer :position
      t.string :picture

      t.datetime  :start_at, null: false
      t.datetime  :planned_achieve_at, null: false
      t.datetime  :actually_achieved_at
      t.datetime  :cancelled_at

      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
