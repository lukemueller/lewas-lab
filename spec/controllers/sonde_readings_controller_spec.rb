require 'rails_helper'

describe SondeReadingsController do
  describe 'GET index' do
    it 'should responde' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'POST import' do
    it 'stores csv data in the database' do
      expect {
        post :import, file: ActionDispatch::Http::UploadedFile.new({
          :tempfile => File.new(Rails.root.join("spec/fixtures/csv/sonde_readings_example.csv"))
        })
      }.to change(SondeReading, :count).by(2)

      first_reading = SondeReading.first
      expect(first_reading.temperature).to eq(11.43)
    end
  end
end
