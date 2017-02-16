class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :full_name, null: false
      t.string :avatar
      t.integer :activity_points, default: 0

      t.references :user, null: false, foreign_key: true, index: true
    end
  end
end
