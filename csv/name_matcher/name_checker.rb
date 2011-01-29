require 'rubygems'
require 'fastercsv'
valid_names = []

name_files = ["girl_names.csv","guy_names.csv"]
name_files.each do |name_file|
  FasterCSV.foreach(name_file) do |row|
    valid_names.push(row[0])
  end
end

FasterCSV.open("questionable_data.csv", "w") do |csv|
  FasterCSV.foreach("data_file.csv") do |row|
    first_name = row[1].strip.upcase
    unless valid_names.include?(first_name)
      puts first_name
      csv << row
    end
  end
end