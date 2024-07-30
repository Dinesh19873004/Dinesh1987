# frozen_string_literal: true

require 'json'
require 'axlsx'
require 'roo'

module JsonExcelConvert
  class Convert
    def self.json_to_excel(json_data, file_path)
      data = JSON.parse(json_data)
      Axlsx::Package.new do |p|
        p.workbook.add_worksheet(name: "Sheet1") do |sheet|
          sheet.add_row data.first.keys
          data.each { |hash| sheet.add_row hash.values }
        end
        p.serialize(file_path)
      end
    end

    def self.excel_to_json(file_path)
      xlsx = Roo::Excelx.new(file_path)
      header = xlsx.row(1)
      data = (2..xlsx.last_row).map do |i|
        Hash[header.zip(xlsx.row(i))]
      end
      JSON.pretty_generate(data)
    end
  end
end
