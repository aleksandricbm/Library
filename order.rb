class Order
attr_accessor :orders, :readers, :books
	def initialize(books,readers)
		@books, @readers = books, readers
		@orders=[]
		random_order
	end

	def random_order
		readers.each { |r|
			orders.push({"book" => books[rand(books.size)]['title'], "reader"=>readers[rand(readers.size)]['name_r'],"date"=>Time.at(rand * Time.now.to_i)})
		}
		puts "random generation orders"

	end

end