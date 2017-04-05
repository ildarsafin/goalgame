class CreateBlogPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_posts do |t|
      t.string :title, null: false
      t.text :content
      t.string :picture, null: false

      t.boolean :approved, default: false

      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
