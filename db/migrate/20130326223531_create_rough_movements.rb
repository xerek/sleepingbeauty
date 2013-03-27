class CreateRoughMovements < ActiveRecord::Migration
  def change
    create_table :rough_movements do |t|
      t.float :time
      t.boolean :really_rough
      t.float :x
      t.float :y
      t.float :z

      t.timestamps
    end
  end
end
