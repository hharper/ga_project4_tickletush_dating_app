class AddColumnToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :status_id, :integer
  end
end
