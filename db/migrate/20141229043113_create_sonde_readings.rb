class CreateSondeReadings < ActiveRecord::Migration
  def change
    create_table :sonde_readings do |t|
      t.datetime :date_time
      t.decimal :temperature
      t.decimal :ph
      t.decimal :specific_conductivity
      t.decimal :disolved_oxygen
      t.decimal :turbidity
      t.decimal :oxidation_reduction_potential
      t.decimal :total_dissolved_solids
      t.decimal :disolved_oxygen_saturation

      t.timestamps null: false
    end
  end
end
