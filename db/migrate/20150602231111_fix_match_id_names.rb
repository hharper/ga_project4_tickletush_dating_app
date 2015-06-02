class FixMatchIdNames < ActiveRecord::Migration
  def change
    rename_column :recommendations, :firstMatch_id, :first_match_id
    rename_column :recommendations, :secondMatch_id, :second_match_id
  end
end
