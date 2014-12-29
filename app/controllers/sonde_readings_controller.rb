require 'sonde_reading_importer'

class SondeReadingsController < ApplicationController
  def index
    @sonde_readings = SondeReading.all
  end

  def import
    uploaded_file = params[:file]
    sonde_reading_importer.import(uploaded_file)

    redirect_to action: :index

    flash[:notice] = "Successfully uploaded #{uploaded_file.original_filename}"
  end

  private
  def sonde_reading_importer
    @@_sonde_reading_importer ||= SondeReadingImporter.new
  end
end
