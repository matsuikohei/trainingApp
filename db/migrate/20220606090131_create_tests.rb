class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.date :test_date, null: false
      t.integer :test_category_id, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
