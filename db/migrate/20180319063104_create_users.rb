class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :uname
    	t.string :password
    	t.string :phone
    	t.string :mail
    	t.date :dob
    	t.string :gender
    	t.string :address

      t.timestamps null: false
    end
  end
end
