class RemoveMatchIdFromRecommendations < ActiveRecord::Migration
  def change
    remove_column :recommendations, :match_id, :integer
  end
end
