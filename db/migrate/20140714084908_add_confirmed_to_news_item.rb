class AddConfirmedToNewsItem < ActiveRecord::Migration
  def change
    add_column :news_items, :confirmed, :boolean
  end
end
