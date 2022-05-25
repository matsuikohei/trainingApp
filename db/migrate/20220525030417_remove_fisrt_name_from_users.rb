class RemoveFisrtNameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :fisrt_name, :string
  end
end
