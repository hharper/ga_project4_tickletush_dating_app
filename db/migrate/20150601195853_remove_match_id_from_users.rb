class RemoveMatchIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :match_id, :integer
  end
end
