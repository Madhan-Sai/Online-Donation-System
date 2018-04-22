class CreateBankAcnts < ActiveRecord::Migration
  def change
    create_table :bank_acnts do |t|
    	t.integer :acntNo
    	t.string :actype
    	t.string :name
    	t.float :balance
      t.timestamps null: false
    end
  end
end
