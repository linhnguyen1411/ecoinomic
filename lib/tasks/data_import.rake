namespace :data do
  desc "import data"
  require 'spreadsheet'

  task import: :environment do
    countries = File.join Rails.root, "countries.xls"
    excel_countries = Spreadsheet.open countries
    excel_countries = excel_countries.worksheet 0
    excel_countries.each do |item|
      value = { name: item[0] }
      Country.create(value)
    end
  end
end
