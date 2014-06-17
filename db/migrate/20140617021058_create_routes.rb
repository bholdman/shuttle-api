class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
