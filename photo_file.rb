# frozen_string_literal: true

require 'date'
require 'exifr/jpeg'

photo_dir = File.join(ENV['PHOTO_DIR'], '*.jpg')
dates = []

Dir[photo_dir].each do |pic_name|
  dt = EXIFR::JPEG.new(pic_name).date_time
  dates << dt unless dt.nil?
end

dates_by_month = dates.group_by { |d| d.strftime('%-m') }
dates_by_month.transform_values!(&:length)

(1..12).each do |d|
  puts "#{d}\t:\t#{dates_by_month[d.to_s]}"
end
