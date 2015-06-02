class AddColumnsToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :firstMatch_id, :integer
  end
end
