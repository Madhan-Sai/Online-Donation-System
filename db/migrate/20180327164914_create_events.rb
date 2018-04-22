class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
		t.integer :organizer
    	t.string :eventName
    	t.string :caption
    	t.string :tags
    	t.string :trustname
    	t.string :location
    	t.float :estAmnt
    	t.float	:collectedAmnt
    	t.date :endDate
    	t.integer :acNo
    	t.integer :ifscCode
      t.timestamps null: false
    end
  end
end
