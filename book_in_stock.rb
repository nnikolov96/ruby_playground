class BookInStock
	attr_accessor :isbn, :price

	def initialize(isbn, price)
		@price = Float(price)
		@isbn = isbn
	end

	def to_s
		"ISBN is #{@isbn}, price is: #{@price}"
	end

	# Virtual attribute
	def price_in_cents
		Integer(price * 100 + 0.5)
	end

	def price_in_cents=(cents)
		@price = cents / 100.0
	end
end

a_book = BookInStock.new('isbn1', 3)
puts a_book
another_book = BookInStock.new('Mqu Book', 5)
puts another_book

