class AddResultsToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :result, :integer
  end
end
