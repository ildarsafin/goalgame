class CreateUserPersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :user_personas do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :persona, null: false, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
