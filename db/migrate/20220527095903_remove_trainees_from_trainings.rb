class RemoveTraineesFromTrainings < ActiveRecord::Migration[6.0]
  def change
    remove_column :trainings, :trainee_id, :integer
  end
end
