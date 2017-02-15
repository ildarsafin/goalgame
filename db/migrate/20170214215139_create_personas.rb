class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.integer :points

      t.references :profile, null: false, foreign_key: true, index: true
    end
  end
end
