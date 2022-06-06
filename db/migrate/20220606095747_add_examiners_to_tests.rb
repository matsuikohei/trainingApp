class AddExaminersToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :examiner_id, :integer
  end
end
