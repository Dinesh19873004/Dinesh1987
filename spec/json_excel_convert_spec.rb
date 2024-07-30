# spec/json_excel_converter_spec.rb
require "spec_helper"

RSpec.describe JsonExcelConvert::Convert do
  let(:json_data) { '[{"name": "John", "age": 30}, {"name": "Jane", "age": 25}]' }
  let(:excel_file) { "test.xlsx" }

  after do
    File.delete(excel_file) if File.exist?(excel_file)
  end

  describe ".json_to_excel" do
    it "creates an Excel file from JSON data" do
      described_class.json_to_excel(json_data, excel_file)
      expect(File.exist?(excel_file)).to be true
    end
  end

  describe ".excel_to_json" do
    it "converts an Excel file to JSON data" do
      described_class.json_to_excel(json_data, excel_file)
      json_result = described_class.excel_to_json(excel_file)
      expect(JSON.parse(json_result)).to eq(JSON.parse(json_data))
    end
  end
end
