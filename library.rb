require './book.rb'
require './order.rb'
require './reader.rb'
require 'faker'
require 'yaml'

class Library

attr_accessor :book, :reader, :orders

	def initialize(book,reader,order)

		@book, @reader, @orders = book, reader, order
		results
	end

	def results

		r=Hash.new(0)
		b=Hash.new(0)

		orders.each do |key|
  			r[key['reader']]+=1
  			b[key['book']]+=1
		end

		max=0
		reader=""
		book=""
		r.each do |k,v|
			if v>max 
				max=v
				reader= "max read book (#{max}) =  #{k}"
			end
		end
		max=0
		b.each do |k,v|
			if v>max 
				max=v
				book= "most popular book: #{k} = #{max}"
			end
		end
		b=Hash[b.sort_by{|k, v| v}.reverse]
		popular=0
		b.keys[0..2].each{|k, v| popular +=b[k] }
		puts reader
		puts book
		puts "sum three most popular books = #{popular}"
	end

end

b=Book.new
r=Reader.new
o=Order.new(b.authors,r.readers)
Library.new(b.authors, r.readers, o.orders)

