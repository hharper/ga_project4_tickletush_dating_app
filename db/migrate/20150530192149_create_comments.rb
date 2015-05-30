class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :recommendation
      t.text :body
    end
  end
end
