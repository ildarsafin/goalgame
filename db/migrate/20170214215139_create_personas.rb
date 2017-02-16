class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.integer :cost, null: false
      t.string :name, null: false
      t.text :description
    end
  end
end
