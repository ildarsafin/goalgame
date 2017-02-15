class CreateAchievings < ActiveRecord::Migration[5.0]
  def change
    create_table :achievings do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :achievement, null: false, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
