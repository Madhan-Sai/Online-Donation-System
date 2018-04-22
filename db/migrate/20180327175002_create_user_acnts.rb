class CreateUserAcnts < ActiveRecord::Migration
  def change
    create_table :user_acnts do |t|
    	t.integer :userNo
    	t.integer :acNo
      t.timestamps null: false
    end
  end
end
