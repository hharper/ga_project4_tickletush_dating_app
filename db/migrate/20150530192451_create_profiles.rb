class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.text :name
      t.text :photo_url
      t.text :city
      t.text :interests
      t.text :about_me
    end
  end
end
