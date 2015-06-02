class AddColumnToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :secondMatch_id, :integer
  end
end
