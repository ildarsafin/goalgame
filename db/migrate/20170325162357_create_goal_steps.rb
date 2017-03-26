class CreateGoalSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :goal_steps do |t|
      t.text :description
      t.integer :position
      t.datetime :done_at

      t.references :goal, null: false, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
