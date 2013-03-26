class CreateLightPowers < ActiveRecord::Migration
  def change
    create_table :light_powers do |t|
      t.float :time
      t.boolean :on

      t.timestamps
    end
  end
end
