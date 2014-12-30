describe SondeReadingImporter do

  UploadedFile = Struct.new(:tempfile)

  before do
    @importer = SondeReadingImporter.new

    file = File.new(File.expand_path("spec/fixtures/csv/sonde_readings_example.csv"))
    @uploaded_file = UploadedFile.new(file)
  end

  describe '#import' do
    it 'parses date time strings to DateTime objects' do
      readings = @importer.import(@uploaded_file)

      expect(readings[0].date_time).to eq(DateTime.new(2014, 8, 4, 11, 26, +0))
      expect(readings[1].date_time).to eq(DateTime.new(2014, 6, 21, 14, 51, +0))
    end

    it 'preserves significant digits for decimal values' do
      readings = @importer.import(@uploaded_file)

      first_reading = readings[0]
      expect(first_reading.temperature).to eq(11.43)
      expect(first_reading.ph).to eq(8.05)
      expect(first_reading.specific_conductivity).to eq(760.0)
      expect(first_reading.dissolved_oxygen).to eq(8.86)
      expect(first_reading.turbidity).to eq(2.9)
      expect(first_reading.oxidation_reduction_potential).to eq(524.0)
      expect(first_reading.total_dissolved_solids).to eq(0.5)
      expect(first_reading.dissolved_oxygen_saturation).to eq(80.2)

      second_reading = readings[1]
      expect(second_reading.temperature).to eq(11.61)
      expect(second_reading.ph).to eq(5.01)
      expect(second_reading.specific_conductivity).to eq(762.0)
      expect(second_reading.dissolved_oxygen).to eq(9.16)
      expect(second_reading.turbidity).to eq(2.4)
      expect(second_reading.oxidation_reduction_potential).to eq(488.0)
      expect(second_reading.total_dissolved_solids).to eq(0.9)
      expect(second_reading.dissolved_oxygen_saturation).to eq(83.3)
    end
  end
end
