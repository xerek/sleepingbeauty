class CreateHeartRates < ActiveRecord::Migration
  def change
    create_table :heart_rates do |t|
      t.integer :rate
      t.float :time

      t.timestamps
    end
  end
end
