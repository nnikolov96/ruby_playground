require 'csv'
require_relative 'book_in_stock'

class CsvReader
	def initialize
		@book_in_stock = []
	end

	def read_in_csv_data(csv_file_name)
		CSV.foreach(csv_file_name, headers: true) do |row|
			@book_in_stock << BookInStock.new(row['ISBN'], row['Price'])
		end
	end

	def total_value_in_stock
		sum = 0.0
		@book_in_stock.each { |book| sum += book.price }
		sum
	end
end