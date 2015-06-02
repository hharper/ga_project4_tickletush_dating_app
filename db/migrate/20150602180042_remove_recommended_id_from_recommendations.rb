class RemoveRecommendedIdFromRecommendations < ActiveRecord::Migration
  def change
    remove_column :recommendations, :recommended_id, :integer
  end
end
