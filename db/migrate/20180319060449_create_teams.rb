class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name
    	t.string :desig
    	t.string :img
    	t.string :dept
    	t.string :clg

      t.timestamps null: false
    end
  end
end
