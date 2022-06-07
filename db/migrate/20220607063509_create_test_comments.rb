class CreateTestComments < ActiveRecord::Migration[6.0]
  def change
    create_table :test_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
