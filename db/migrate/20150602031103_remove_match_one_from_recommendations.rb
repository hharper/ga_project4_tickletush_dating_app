class RemoveMatchOneFromRecommendations < ActiveRecord::Migration
  def change
    remove_column :recommendations, :matchOne, :text
  end
end
