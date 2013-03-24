class CreateHeartMonitors < ActiveRecord::Migration
  def change
    create_table :heart_monitors do |t|
      t.float :bpm

      t.timestamps
    end
  end
end
