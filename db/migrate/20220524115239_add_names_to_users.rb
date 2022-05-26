class AddNamesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :employee_number, :string, null: false
    add_index :users, :employee_number, unique: true
  end
end
