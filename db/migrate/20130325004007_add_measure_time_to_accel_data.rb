class AddMeasureTimeToAccelData < ActiveRecord::Migration
  def change
    add_column :accel_data, :measure_time, :timestamp
  end
end
