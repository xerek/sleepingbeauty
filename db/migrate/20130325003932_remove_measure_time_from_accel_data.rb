class RemoveMeasureTimeFromAccelData < ActiveRecord::Migration
  def up
    remove_column :accel_data, :measure_time
  end

  def down
    add_column :accel_data, :measure_time, :float
  end
end
