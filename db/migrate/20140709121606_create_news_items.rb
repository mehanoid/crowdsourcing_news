class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :title
      t.string :description
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
