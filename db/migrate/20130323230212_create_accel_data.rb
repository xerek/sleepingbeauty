class CreateAccelData < ActiveRecord::Migration
  def change
    create_table :accel_data do |t|
      t.float :bpm
      t.float :x
      t.float :y
      t.float :z
      t.float :measure_time

      t.timestamps
    end
  end
end
