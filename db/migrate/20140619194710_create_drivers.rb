class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.boolean :active, :default => false, :null => false
      t.boolean :archived, :default => false, :null => false
      t.datetime :archived_on		
      t.timestamps
    end
  end
end
