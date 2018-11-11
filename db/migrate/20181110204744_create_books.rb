class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :rank
      t.integer :rank_last_week
      t.integer :weeks_on_list
      t.string :amazon_product_href
      t.string :book_image_href
      t.text :description
      t.date :published_date

      t.timestamps
    end
  end
end
