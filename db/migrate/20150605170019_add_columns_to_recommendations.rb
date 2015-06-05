class AddColumnsToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :first_match_id, :integer
    add_column :recommendations, :second_match_id, :integer
  end
end
