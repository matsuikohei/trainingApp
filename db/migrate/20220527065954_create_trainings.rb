class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.date :training_date, null: false
      t.integer :training_category_id, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
