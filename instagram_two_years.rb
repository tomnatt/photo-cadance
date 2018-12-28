# frozen_string_literal: true

require 'instagram'
require 'date'

token = ENV['INSTAGRAM_ACCESS_TOKEN']
client = Instagram.client(access_token: token)
year_start = Date.parse('2017-01-01').strftime('%s')
dates = []
next_max_id = nil
continue_loop = true

# This will break if the account isn't a year old
while continue_loop
  results = client.user_recent_media(count: 20, max_id: next_max_id)
  results.each do |pic|
    if pic.created_time > year_start
      dates << pic.created_time
    else
      continue_loop = false
    end
  end
  next_max_id = results.pagination.next_max_id
end

# Convert to DateTime objects
dates.map! { |d| Time.at(d.to_i).to_datetime }

# Group by month
dates_by_month = dates.group_by { |d| d.strftime('%-m %Y') }
dates_by_month.transform_values!(&:length)

puts 'Dates by month from Instagram'
(1..12).each do |d|
  key = "#{d} 2017"
  puts "#{key}\t:\t#{dates_by_month[key]}"

  key = "#{d} 2018"
  puts "#{key}\t:\t#{dates_by_month[key]}"
end
