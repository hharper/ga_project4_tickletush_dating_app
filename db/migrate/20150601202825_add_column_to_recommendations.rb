class AddColumnToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :recommended_id, :integer
  end
end
