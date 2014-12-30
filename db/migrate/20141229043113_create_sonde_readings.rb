class CreateSondeReadings < ActiveRecord::Migration
  def change
    create_table :sonde_readings do |t|
      t.datetime :date_time
      t.decimal :temperature, precision: 16, scale: 4
      t.decimal :ph, precision: 16, scale: 4
      t.decimal :specific_conductivity, precision: 16, scale: 4
      t.decimal :dissolved_oxygen, precision: 16, scale: 4
      t.decimal :turbidity, precision: 16, scale: 4
      t.decimal :oxidation_reduction_potential, precision: 16, scale: 4
      t.decimal :total_dissolved_solids, precision: 16, scale: 4
      t.decimal :dissolved_oxygen_saturation, precision: 16, scale: 4

      t.timestamps null: false
    end
  end
end
