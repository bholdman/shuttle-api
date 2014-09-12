class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.boolean :active, :default => false, :null => false
      t.boolean :archived, :default => false, :null => false
      t.datetime :archived_on
      t.timestamps
    end
  end
end
