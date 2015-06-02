class RemoveMatchTwoFromRecommendations < ActiveRecord::Migration
  def change
    remove_column :recommendations, :matchTwo, :text
  end
end
