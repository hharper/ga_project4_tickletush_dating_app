class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.belongs_to :user
      t.text :matchOne
      t.text :matchTwo
    end
  end
end
