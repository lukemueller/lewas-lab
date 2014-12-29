require 'csv'

class SondeReadingImporter
    def import(file)
        CSV.foreach(file.tempfile, {:headers => true, :col_sep => ','}) do |row|
          SondeReading.create(
            :date_time => row['Date / Time'],
            :temperature => row['Temp [°C]'],
            :ph => row['pH [Units]'],
            :specific_conductivity => row['SpCond [µS/cm]'],
            :disolved_oxygen => row['DO [mg/l]'],
            :turbidity => row['TurbSC [NTU]'],
            :oxidation_reduction_potential => row['ORP [mV]'],
            :total_dissolved_solids => row['TDS [g/l]'],
            :disolved_oxygen_saturation => row['DO% [Sat]'],
          )
        end
    end
end