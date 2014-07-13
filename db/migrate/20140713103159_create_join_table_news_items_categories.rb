class CreateJoinTableNewsItemsCategories < ActiveRecord::Migration
  def change
    create_join_table :news_items, :news_categories, table_name: :news_categories_items do |t|
      t.index :news_item_id
      t.index :news_category_id
    end
  end
end
