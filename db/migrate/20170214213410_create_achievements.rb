class CreateAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :achievements do |t|
      t.string :title, null: false
      t.string :badge, null: false
      t.text :description
    end
  end
end
