class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :userid
      t.attachment :image

      t.timestamps null: false
    end
  end
end
