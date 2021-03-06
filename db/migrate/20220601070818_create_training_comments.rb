class CreateTrainingComments < ActiveRecord::Migration[6.0]
  def change
    create_table :training_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :training, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
