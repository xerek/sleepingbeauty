class CreateRoughMovements < ActiveRecord::Migration
  def change
    create_table :rough_movements do |t|
      t.float :time
      t.boolean :roughy

      t.timestamps
    end
  end
end
