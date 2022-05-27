class AddTrainersToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :trainee_id, :integer, null: false
    add_column :trainings, :trainer_id, :integer, null: false
  end
end
