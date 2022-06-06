class RemoveContentsFromTests < ActiveRecord::Migration[6.0]
  def change
    remove_column :tests, :content, :text
  end
end
