class CreateBanktransactions < ActiveRecord::Migration
  def change
    create_table :banktransactions do |t|
    	t.integer :acntNo
    	t.string :type
    	t.date :onDate
      t.timestamps null: false
    end
  end
end
