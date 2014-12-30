require 'sonde_reading_importer'

class SondeReadingsController < ApplicationController
  def index
    @sonde_readings = SondeReading.all
  end

  def import
    uploaded_file = params[:file]

    reading_entities = sonde_reading_importer.import(uploaded_file)
    persist_readings(reading_entities)

    redirect_to action: :index

    flash[:notice] = "Successfully uploaded #{uploaded_file.original_filename}"
  end

  private
  def sonde_reading_importer
    @@_sonde_reading_importer ||= SondeReadingImporter.new
  end

  def persist_readings(reading_entities)
    reading_entities.map do |reading_entity|
      SondeReading.create(
        date_time: reading_entity.date_time,
        temperature: reading_entity.temperature,
        ph: reading_entity.ph,
        specific_conductivity: reading_entity.specific_conductivity,
        dissolved_oxygen: reading_entity.dissolved_oxygen,
        turbidity: reading_entity.turbidity,
        oxidation_reduction_potential: reading_entity.oxidation_reduction_potential,
        total_dissolved_solids: reading_entity.total_dissolved_solids,
        dissolved_oxygen_saturation: reading_entity.dissolved_oxygen_saturation,
      )
    end
  end
end
