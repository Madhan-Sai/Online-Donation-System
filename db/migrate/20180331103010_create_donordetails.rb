class CreateDonordetails < ActiveRecord::Migration
  def change
    create_table :donordetails do |t|
    	t.integer :eventid
    	t.integer :donorid
    	t.float :amnt
    	t.integer :acntNo
      t.timestamps null: false
    end
  end
end
