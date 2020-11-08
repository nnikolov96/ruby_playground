require 'csv'
require_relative 'movie'

rows = CSV.read('movies.csv', headers: true, header_converters: :symbol, skip_blanks: true)

movies = rows.collect { |row| Movie.new(row) }

with_rotten_tomatoes = movies.select { |movie| movie.rotten_tomatoes.positive? }

total = with_rotten_tomatoes.reduce(0.0) do |total, movie|
  total + movie.rotten_tomatoes
end

count_by_month = {}
movies.each do |movie|
  month_name = movie.release_date.strftime('%B')
  count_by_month[month_name] ||= 0
  count_by_month[month_name] += 1
end

count_by_month = movies.group_by do |movie|
                  movie.release_date.strftime('%B')
                end
                .map do |month, list|
                  [month, list.size]
                end
                .sort_by(&:last).reverse

count_by_month = count_by_month.map { |pair| pair.join(': ')}.join("\n")
puts count_by_month