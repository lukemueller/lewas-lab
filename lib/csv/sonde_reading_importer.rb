require 'csv'

class SondeReadingImporter
    def import(file)
        readings = []

        CSV.foreach(file.tempfile, {:headers => true, :col_sep => ','}) do |row|
          readings << SondeReadingEntity.new(
            DateTime.parse(row['Date / Time']),
            row['Temp [°C]'].to_f,
            row['pH [Units]'].to_f,
            row['SpCond [µS/cm]'].to_f,
            row['DO [mg/l]'].to_f,
            row['TurbSC [NTU]'].to_f,
            row['ORP [mV]'].to_f,
            row['TDS [g/l]'].to_f,
            row['DO% [Sat]'].to_f,
          )
        end

      readings
    end

  SondeReadingEntity = Struct.new(
    :date_time,
    :temperature,
    :ph,
    :specific_conductivity,
    :dissolved_oxygen,
    :turbidity,
    :oxidation_reduction_potential,
    :total_dissolved_solids,
    :dissolved_oxygen_saturation,
  )
end
