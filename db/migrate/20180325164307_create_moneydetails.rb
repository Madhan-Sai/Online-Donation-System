class CreateMoneydetails < ActiveRecord::Migration
  def change
    create_table :moneydetails do |t|
    	t.integer :organizerid
    	t.integer :eventid
    	t.string :description
    	t.float :amount
    	
      t.timestamps null: false
    end
  end
end
