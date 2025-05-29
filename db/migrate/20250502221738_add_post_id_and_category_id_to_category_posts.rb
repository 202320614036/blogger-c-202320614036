class AddPostIdAndCategoryIdToCategoryPosts < ActiveRecord::Migration[7.1]
  def change
    # ZATEN varsa birini tekrar ekleme
    add_reference :category_posts, :post, null: false, foreign_key: true unless column_exists?(:category_posts, :post_id)
    add_reference :category_posts, :category, null: false, foreign_key: true unless column_exists?(:category_posts, :category_id)
  end
end
