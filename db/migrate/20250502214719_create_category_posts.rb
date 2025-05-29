class CreateCategoryPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :category_posts do |t|
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
