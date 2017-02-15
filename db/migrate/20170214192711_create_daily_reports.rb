class CreateDailyReports < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_reports do |t|
      t.text :content, null: false

      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
