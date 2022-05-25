class AddLastNamesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string, null: false
    add_column :users, :fisrt_name, :string, null: false
  end
end
